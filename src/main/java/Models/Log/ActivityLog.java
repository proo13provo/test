package Models.Log;

import java.util.Date;

public class ActivityLog {
    private Long id;
    private String username;
    private String role;
    private String actionType;
    private String description;
    private Long entityId;
    private Date actionTime;

    public ActivityLog() {
    }
    public ActivityLog(String username, String role, String actionType, String description, Long entityId) {
        this.username = username;
        this.role = role;
        this.actionType = actionType;
        this.description = description;
        this.entityId = entityId;
        this.actionTime = new Date();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getEntityId() {
        return entityId;
    }

    public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

    public Date getActionTime() {
        return actionTime;
    }

    public void setActionTime(Date actionTime) {
        this.actionTime = actionTime;
    }
}
