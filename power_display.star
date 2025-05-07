# power_display.star
# Tronbyt Power Display App
#
# This app will fetch and display real-time power consumption from Home Assistant.
#
# TODO: Implement Home Assistant API integration
# TODO: Display power usage and units
# TODO: Add configuration options

def main():
    # Get the entity_id from configuration (default to 'power.current_power' if not set)
    entity_id = config.get("entity_id", "power.current_power")
    # Placeholder: Simulate a fetched value for demonstration
    value = 75  # Replace with actual fetched value
    # Create a canvas (assuming 64x32 for Tronbyt)
    canvas = create_canvas(64, 32)
    draw_power_display(canvas, value)
    # Return or display the canvas as needed
    return canvas

def get_color(value):
    if value < 0:
        return "green"
    elif value < 90:
        return "yellow"
    else:
        return "orange" 

def draw_power_display(canvas, value):
    color = get_color(value)
    # Draw the value as text
    canvas.text(0, 0, "{} W".format(value), color="white")
    # Draw a colored bar
    bar_length = min(int(value), canvas.width)
    canvas.rect(0, 10, bar_length, 5, color=color) 