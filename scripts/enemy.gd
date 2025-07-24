extends CharacterBody2D

class_name Enemy

#store effect indices
var effect_level = {
	"none": 0,
	"flatten": 0,
	"headless": 0,
}


var hp_damage
var sp_damage
var hit_cooldown
var effect
var speed

var health
var ai_off

func take_damage(hit_damage, hit_effect):
	health -= hit_damage
	if health <= 0:
		queue_free()
	return



#the plan - make turning off ai a universal function
