<div id="calendar">
	<%= month_calendar do |date| %>
  <!--<div id="monthday">-->
  <%= date.day %>
  <!--</div>-->
  <% Reservations.each do |r| %>
    <% if date.strftime("%m/%d/%Y") == r.start_date.strftime("%m/%d/%Y")%>
     <div id="meeting">
      <%= r.name %>
    </div>
    <% end %>
  <% end %>

<% end %>
</div>