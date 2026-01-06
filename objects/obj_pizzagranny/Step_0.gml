talking = state != 0

sprite_index = talking ? talkspr : sleepspr
var talkvariations = irandom_range(1, 3)

switch (state)
{
	case 0:
		internal_y = max(internal_y - 5, -bubble.h - padding);
		if (obj_player.state != states.backtohub && place_meeting(x, y, obj_player))
		{
			state = 1
			audio_stop_sound(voice1)
			audio_stop_sound(voice2)
			audio_stop_sound(voice3)
			scr_sound_3d(asset_get_index(string_concat("voice", slipend_variations)), x, y)
			vsp = 0
		}
		break;
	case 1:
		internal_y += vsp;
		if vsp < 20
			vsp += 0.5
		if internal_y > padding
			state = 2
		break;
	case 2:
		internal_y = max(internal_y - 2, padding)
		if !place_meeting(x, y, obj_player)
			state = 0
		break;
}

bg_pos.x++
bg_pos.y++

wave_timer += 20

bubble.x = padding + wave(-5, 5, 2, 10, wave_timer)
bubble.y = internal_y + wave(-1, 1, 4, 0, wave_timer)
