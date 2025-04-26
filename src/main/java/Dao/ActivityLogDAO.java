package Dao;

import Models.Log.ActivityLog;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class ActivityLogDAO {
    ConnDB dao = new ConnDB();

    public void saveLog(ActivityLog log) throws SQLException {
        String sql = "INSERT INTO activity_logs (username, role, action_type, description, entity_id, action_time) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = dao.conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)){
            stmt.setString(1, log.getUsername());
            stmt.setString(2, log.getRole());
            stmt.setString(3, log.getActionType());
            stmt.setString(4, log.getDescription());
            stmt.setObject(5, log.getEntityId());
            stmt.setTimestamp(6, new Timestamp(log.getActionTime().getTime()));

            stmt.executeUpdate();
        }
    }

    public List<ActivityLog> getLogsByUsername(String username) throws SQLException {
        List<ActivityLog> logs = new ArrayList<>();
        String sql = "SELECT * FROM activity_logs WHERE username = ? ORDER BY action_time DESC";
        try (PreparedStatement pstmt = dao.conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                logs.add(mapResultSetToLog(rs));
            }
        }
        return logs;
    }

    public List<ActivityLog> getAllLogs() throws SQLException {
        List<ActivityLog> logs = new ArrayList<>();
        String sql = "SELECT * FROM activity_logs ORDER BY action_time DESC";
        try (PreparedStatement pstmt = dao.conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                logs.add(mapResultSetToLog(rs));
            }
        }
        return logs;
    }

    public List<ActivityLog> getLogsByDateRange(Date startDate, Date endDate) throws SQLException {
        List<ActivityLog> logs = new ArrayList<>();
        String sql = "SELECT * FROM activity_logs WHERE action_time BETWEEN ? AND ? ORDER BY action_time DESC";
        try (PreparedStatement pstmt = dao.conn.prepareStatement(sql)) {
            pstmt.setTimestamp(1, new Timestamp(startDate.getTime()));
            pstmt.setTimestamp(2, new Timestamp(endDate.getTime()));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                logs.add(mapResultSetToLog(rs));
            }
        }
        return logs;
    }

    public List<ActivityLog> getLogsByType(String actionType) throws SQLException {
        List<ActivityLog> logs = new ArrayList<>();
        String sql = "SELECT * FROM activity_logs WHERE action_type = ? ORDER BY action_time DESC";
        try (PreparedStatement pstmt = dao.conn.prepareStatement(sql)) {
            pstmt.setString(1, actionType);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                logs.add(mapResultSetToLog(rs));
            }
        }
        return logs;
    }

    private ActivityLog mapResultSetToLog(ResultSet rs) throws SQLException {
        ActivityLog log = new ActivityLog();
        log.setId(rs.getLong("id"));
        log.setUsername(rs.getString("username"));
        log.setRole(rs.getString("role"));
        log.setActionType(rs.getString("action_type"));
        log.setDescription(rs.getString("description"));
        log.setEntityId(rs.getLong("entity_id"));
        log.setActionTime(rs.getTimestamp("action_time"));
        return log;
    }
}