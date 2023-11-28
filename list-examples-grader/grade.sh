CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
if [[ -f student-submission/ListExamples.java ]]
then
    cp -r student-submission/ListExamples.java grading-area
    cp -r TestListExamples.java grading-area
    echo 'Valid code'
elif [[ -e student-submission/ListExamples.java ]]
then
    echo 'This is a directory'
else 
    echo 'The file does not exist'
fi
cp -r lib grading-area
cd grading-area
javac -cp '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar' *.java
java -cp '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar' org.junit.runner.JUnitCore TestListExamples
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
