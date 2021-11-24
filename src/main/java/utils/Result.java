package utils;

public class Result {
    private final double x;
    private final double y;
    private final double r;
    private final String currentTime;
    private final String executionTime;
    private final String answer;
    private final String figure;

    public Result(double x, double y, double r, String currentTime, String executionTime, String answer, String figure) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.currentTime = currentTime;
        this.executionTime = executionTime;
        this.answer = answer;
        this.figure = figure;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public String getExecutionTime() {
        return executionTime;
    }

    public String getAnswer() {
        return answer;
    }

    public String getFigure() {
        return figure;
    }
}
