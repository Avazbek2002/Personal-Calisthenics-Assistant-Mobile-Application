# Personal-Calisthenics-Assistant-Mobile-Application

Like in every sport, in calisthenics, visual demonstration and instant feedback for performance
play a paramount role. Currently developed applications offer visual and verbal demonstration
of each skill using a video recording. However, the problem with these mobile applications is
that their visual demonstrations do not contain information on which muscles work during the
exercise, and they do not provide any sort of feedback on a player’s performance. This disser-
tation focuses on the development of a mobile application designed for personal calisthenics
training. The application utilizes virtual muscle simulation to demonstrate the progression of
various types of skills, highlighting the specific muscles worked during each exercise. The
application also uses pose estimation technology to analyze an athlete’s performance through
video recording, providing feedback through simplistic natural language processing. The feed-
back provided includes an explanation of any mistakes made and recommended exercises to
improve performance. Overall, this dissertation aims to enhance the efficacy and efficiency of
personal calisthenics training through the integration of technology and real-time performance
analysis.
Keywords: Swift, Mobile App, Machine Learning, Pose Estimation, Muscle Simulation, Xcode

## Application Development
Aiming to deliver a clean and intuitive user experience, the application’s design followed a
structured approach by dividing it into 5 distinct sections. Each section encompassed multiple pages, with each page dedicated to accomplishing specific tasks within the app’s overall
functionality. This design strategy ensured that individual pages presented a focused visual
33
interface, avoiding potential clutter and confusion that could arise from trying to incorporate
too many elements on a single screen. The 5 main sections are as follows:
1. Log in section
2. Sign Up section
3. Profile section
4. Calisthenics Skills section
5. Workout section

<img width="365" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/7a946710-6337-4cf8-b9f2-d9a5dd1e6401">
<img width="717" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/0c1da0eb-e66e-4d16-99f1-612fa8226b5b">
<img width="696" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/e7b3fcc2-745a-4be2-8656-702fd43a4dbd">
<img width="476" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/f9c5bd18-0043-4165-94a9-d4edda6005fe">
<img width="476" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/508732c6-3602-4aea-98c0-ca821c0963bd">

## ML model description
The solution for counting repetitions in repetitive calisthenics exercises leverages a method inspired by PoseRAC. This approach captures each action by focusing on two salient poses instead of numerous frames, reducing computational costs and enhancing performance. PoseRAC utilizes Pose Saliency Annotation for training and employs a Transformer encoder to determine the significance of each exercise pose. However, due to the impracticality of integrating such a large model into a mobile device, an alternative approach using a dense neural network with two hidden layers was adopted.

The model was trained on a dataset from YouTube videos, including exercises like front lever, back lever, handstand, human flag, push-ups, pull-ups, and dips. Static exercises (front lever, back lever, handstand, human flag) are measured by duration, while repetitive exercises (push-ups, pull-ups, dips) are counted.

The pipeline for inference and training involves:

* Detecting pose landmarks using the MoveNet pose estimation model.
* Normalizing these landmarks to a consistent pose size.
* Converting normalized landmarks into a vector representation (embedding) for input to machine learning models.
* Feeding normalized embeddings into a dense neural network to classify exercises.
* Using the Action-Trigger module to count repetitions by identifying two salient poses in sequence.
* The feedback mechanism operates concurrently with repetition counting or duration measurement. It evaluates joint angles against ideal angles specific to each exercise, providing real-time feedback (verbal, visual, textual, or auditory) to correct form inconsistencies.
<figure>
<img width="593" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/d9e9e54d-5830-47bb-bfe9-1fbd7095668d">
<figcaption>The results of salient pose recognition model</figcaption>
</figure>
<figure>
  <img width="776" alt="image" src="https://github.com/Avazbek2002/Personal-Calisthenics-Assistant-Mobile-Application/assets/64166521/92cedb7f-d5cb-4476-8904-92e41f50053e">
  <figcaption>Structure of PoseRAC model</figcaption>
</figure>
