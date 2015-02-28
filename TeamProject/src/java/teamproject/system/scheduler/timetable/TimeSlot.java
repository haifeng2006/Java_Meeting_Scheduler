package teamproject.system.scheduler.timetable;

import java.time.LocalDateTime;
import teamproject.meeting.Meeting;
import java.util.HashSet;
import java.util.Objects;
import javafx.util.Duration;

public class TimeSlot {

    private static final Duration duration = Duration.minutes(15);
    private final LocalDateTime startTime;
    private HashSet<Meeting> meetings;
    private int maxPriority = 0;
    private int totalPriority = 0;
    private boolean free = true;
    private boolean schedulable = true;
    private boolean overidable = false;
    
    public TimeSlot(LocalDateTime startTime){
        this.startTime = startTime;
        meetings = new HashSet<>();
    }

    /**
     * Creates a HTML td tag the contains the names and length of each meeting.   
     * @return String HTML td.
     */
    public String toHTML(){
        return this.toHTML(1);
    }
    /**
     * Creates a HTML td tag the contains the names and length of each meeting.   
     * @param row number of rows to span.
     * @return String HTML td with rowspan = row.
     */
    public String toHTML(int row){

        String html = "<td rowspan=\" " +  row +"\" class =";

        switch(meetings.size()) {
            case 0:
                html += "\"\"";
                break;
            case 1:
                html += "\"occupied\"";
                break;
            default:
                html += "\"collision\"";
                break;
        }
        html += ">";
        html += this.startTime.toString() ;
        for (Meeting m1 : meetings) {
            html += m1.getTitle() + " " + m1.getLength() + " ";
        }

        html+="</td>";
        return html;
    }


    public String toSchedulerHTML(){
        
        //TODO create a page to link to
        String html = "<a href=\"" + ((free && schedulable)?"  ":"#") + "\"><td class =";

        if(free && schedulable)
        {
            html += "\"canSchedule\"";
        }
        else
        {
            System.out.println("cantSchedule");
            html += "\"cantSchedule\"";
        }
        
        
        html += ">";
        if((free && schedulable))
        {
            html += "Max Priority:" + this.maxPriority;
            html += " Total:" + this.totalPriority;
        }
       

        html+="</td></a>";
        return html;
    }

    
    
    /**
     * Add a meeting to the hashSet.
     * @param meeting meeting to add.
     */
    public void add(Meeting meeting){
        free = false;
        int piority = meeting.getPiority();
        this.totalPriority += piority;
        this.maxPriority = piority < maxPriority?maxPriority:piority;
        meetings.add(meeting);
    }
    /**
     * Returns true if this set contains no elements.
     * @return true if this set contains no elements. 
     */
    public boolean isEmpty(){
        return meetings.isEmpty();
    }
    
    /**
     * 
     * {@inheritDoc }
     */
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.meetings);
        return hash;
    }
    /**
     * {@inheritDoc }
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }  
        if (getClass() != obj.getClass()) {
            return false;
        }
        final TimeSlot other = (TimeSlot) obj;
        if (!Objects.equals(this.meetings, other.meetings)) {
            return false;
        }
        return true;
    }

    public void setNotFree()
    {
        this.free = false;
    }        
    
    public void setOveridable(boolean overide)
    {
        overidable = overide;
    }
    
    public void setCantScheduleTo()
    {
        this.schedulable = false;
    } 
    
    public int getMaxPriority()
    {
        return maxPriority;
    }

    public int getTotalPriority() 
    {
        return totalPriority;
    }

    public boolean isFree() 
    {
        return free;
    }

    public boolean isSchedulable() 
    {
        return schedulable;
    }
    
    public static Duration getDuration() 
    {
        return duration;
    }   
}
