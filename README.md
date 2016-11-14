# icinga_mini
mini check plugins for icinga, containing dummy and random checks

# return_time_based_state.sh
This plugin returns fake states for general and report testing purposes

``` 
object CheckCommand "return_time_based_state" {
	import "plugin-check-command"

	command = [ PluginDir + "icinga_mini/return_time_based_state.sh" ]

	arguments = {
		"ok" = {
			value = "$hour_OK$"
			description = "return OK before this time (hour, int)"
			order = 1
			skip_key = true
		}
		"warn" = {
			value = "$hour_WARN$"
			description = "return WARN between OK and this time (hour, int)"
			order = 2
			skip_key = true
		}
	}
}
``` 
