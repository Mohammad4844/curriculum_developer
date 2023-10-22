import vertexai
from vertexai.language_models import TextGenerationModel

import json
import sys

courses = json.loads(sys.argv[1])
user_args = json.loads(sys.argv[2])

vertexai.init(project="ace-line-402807", location="us-central1")
parameters = {
    "candidate_count": 1,
    "max_output_tokens": 1024,
    "temperature": 0.2,
    "top_p": 0.8,
    "top_k": 40
}
model = TextGenerationModel.from_pretrained("text-bison")
response = model.predict(
    f"""
You are an expert at academia and designing curriculum for all disciplines. Based on a list of relevant courses, design a curriculum for a student who is interested in this discipline.
The student has time constraints in terms of how many hours / week they can put in and in how long of a time frame they want to complete the curriculum. Based on the hourly requirement of a course, design the curriculum in such a way that the student can complete it with their time constraints.
Keeping in mind pre-requisites of courses, also add a label to each course that you suggested classifying it as either 'beginner', 'intermediate' or 'advanced' depending on how it falls in the bigger scheme of things.

Course List:
{courses}

Student:
discipline of choice: {user_args['major']}
concentration choice: {user_args['concentration']}
time frame in which to complete: {user_args['time_frame']}
maximum hours per week time commitment: {user_args['hrs_week']}
reason for choosing this major: {user_args['reason_for_pursuing']}

Your output should be in json list, with each item of the form:

{{
    "course_title": <COURSE_TITLE>,
    "label": <LABEL>
}}
""",
    **parameters
)
print(response.text)