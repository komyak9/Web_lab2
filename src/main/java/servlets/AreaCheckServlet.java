package servlets;

import utils.Result;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AreaCheckServlet extends HttpServlet {
    public String figure = "No";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long start = System.nanoTime();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        String currentTime = formatter.format(date);
        if (req.getParameter("x") != null && req.getParameter("y") != null && req.getParameter("r") != null) {
            String paramX = req.getParameter("x");
            String paramY = req.getParameter("y");
            String paramR = req.getParameter("r");

            if (validateData(paramX, paramY, paramR)) {
                double x = Double.parseDouble(paramX);
                double y = Double.parseDouble(paramY);
                double r = Double.parseDouble(paramR);

                String answer = checkHit(x, y, r);

                String executionTime = String.format("%.6f", (System.nanoTime() - start) * 10e-9).replace(",", ".");
                Result result = new Result(x, y, r, currentTime, executionTime, answer, figure);
                ArrayList<Result> results;
                if (getServletContext().getAttribute("results") != null) {
                    results = (ArrayList<Result>) getServletContext().getAttribute("results");
                } else results = new ArrayList<>();
                results.add(result);
                getServletContext().setAttribute("results", results);
            }
            getServletContext().getRequestDispatcher("/table.jsp").forward(req, resp);
        } else getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
    }


    private boolean validateData(String x, String y, String r) {
        return validateX(x) && validateY(y) && validateR(r);
    }

    private boolean validateX(String x) {
        try {
            double xNum = Double.parseDouble(x);
            return xNum > -5 && xNum < 3;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean validateY(String y) {
        try {
            double yNum = Double.parseDouble(y);
            return yNum >= -4 && yNum <= 4;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean validateR(String r) {
        String[] values = {"1", "1.5", "2", "2.5", "3"};
        for (String value : values) {
            if (r.equals(value)) {
                return true;
            }
        }
        return false;
    }

    private boolean rectangle(double x, double y, double r) {
        if (x >= 0 && x <= r && y >= 0 && y <= r) {
            figure = "Rectangle";
            return true;
        } else return false;
    }

    private boolean triangle(double x, double y, double r) {
        if (x <= 0 && x >= -r / 2 && y <= 0 && y >= -x - r / 2) {
            figure = "Triangle";
            return true;
        } else return false;
    }

    private boolean circle(double x, double y, double r) {
        if (x >= 0 && x <= r/2 && y <= 0 && y*y <= (r/2)*(r/2) - (x*x)) {
            figure = "Circle";
            return true;
        } else return false;
    }

    private String checkHit(double x, double y, double r) {
        if (rectangle(x, y, r) || triangle(x, y, r) || circle(x, y, r))
            return "Yes";
        else {
            figure = "No";
            return "No";
        }

    }
}
