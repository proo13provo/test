package Services;

import Dao.FeedbackDao;
import Models.Feedback.Feedback;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class ServiceFeedback {
    private FeedbackDao feedbackDao = new FeedbackDao();
    public List<Feedback> getFeedbacksByProductId(int productId) throws SQLException {
    return feedbackDao.getFeedbacksByProductId(productId);
    }
    public int getIdOrderDetails(String idOrder, String idProduct){
        return feedbackDao.getIdOrderDetails(idOrder,idProduct);
    }
    public int insertReview(String comment, int idOrderDetail, int ratingRank, String status){

     return   feedbackDao.insertReview( comment,   idOrderDetail, ratingRank, status);
    }
    public  void insertFeedbackImage(int feedbackId, String imageUrl) throws SQLException{
        feedbackDao.insertFeedbackImage(feedbackId, imageUrl);
    }

}
