
;---------------------------------------------------------------------------
; AI Guarding Helper
[StateDef 9742]
type = A
movetype = I
physics = N
ctrl = 0
anim = 9741

[State 9742, BindToRoot]
type = BindToRoot
trigger1 = PlayerIdExist(Root,ID)
facing = 1
pos = 0,0
ignorehitpause = 1

[State 9742, Guarding Adaption]
type = Null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemynear, movehit = 1
triggerall = (root, prevstateno = 131) || (root, prevstateno = [150,153]) && root, statetype = C
triggerall = enemynear, statetype != A
trigger1 = !var(1)
trigger1 = var(1) := enemynear, stateno
trigger2 = var(1)
trigger2 = !var(2)
trigger2 = enemynear, stateno != var(1)
trigger2 = var(2) := enemynear, stateno
trigger3 = var(1) && var(2)
trigger3 = !var(3)
trigger3 = enemynear, stateno != var(1) && enemynear, stateno != var(2)
trigger3 = var(3) := enemynear, stateno
trigger4 = var(1) && var(2) && var(3)
trigger4 = !var(4)
trigger4 = enemynear, stateno != var(1) && enemynear, stateno != var(2) && enemynear, stateno != var(3)
trigger4 = var(4) := enemynear, stateno
trigger5 = var(1) && var(2) && var(3) && var(4)
trigger5 = !var(5)
trigger5 = enemynear, stateno != var(1) && enemynear, stateno != var(2) && enemynear, stateno != var(3) && enemynear, stateno != var(4)
trigger5 = var(5) := enemynear, stateno
trigger6 = var(1) && var(2) && var(3) && var(4) && var(5)
trigger6 = !var(6)
trigger6 = enemynear, stateno != var(1) && enemynear, stateno != var(2) && enemynear, stateno != var(3) && enemynear, stateno != var(4) && enemynear, stateno != var(5)
trigger6 = var(6) := enemynear, stateno

[State 9742, AI Simple Storage]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
trigger1 = enemynear, stateno = var(0)
trigger1 = var(59) := var(0) || 1
trigger2 = enemynear, stateno = var(1)
trigger2 = var(59) := var(1) || 1
trigger3 = enemynear, stateno = var(2)
trigger3 = var(59) := var(2) || 1
trigger4 = enemynear, stateno = var(3)
trigger4 = var(59) := var(3) || 1
trigger5 = enemynear, stateno = var(4)
trigger5 = var(59) := var(4) || 1
trigger6 = enemynear, stateno = var(5)
trigger6 = var(59) := var(5) || 1
trigger7 = enemynear, stateno = var(6)
trigger7 = var(59) := var(6) || 1

[State 9742, AI MEASUREMENTS]
type = DisplayToClipboard
trigger1 = 1
text = "StandGuard = %d"
params = var(59)
ignorehitpause = 1
persistent = 1

;---------------------------------------------------------------------------
; AI Counter Memory Helper
[StateDef 9743]
type = A
movetype = I
physics = N
ctrl = 0
anim = 9741

[State 9743, BindToRoot]
type = BindToRoot
trigger1 = PlayerIdExist(Root,ID)
facing = 1
pos = 0,0
ignorehitpause = 1

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(0)
trigger1 = !var(25)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(0) := enemynear, stateno
trigger1 = var(25) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(1)
trigger1 = !var(26)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(1) := enemynear, stateno
trigger1 = var(26) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(2)
trigger1 = !var(27)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(2) := enemynear, stateno
trigger1 = var(27) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(3)
trigger1 = !var(28)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(3) := enemynear, stateno
trigger1 = var(28) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(4)
trigger1 = !var(29)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(4) := enemynear, stateno
trigger1 = var(29) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(5)
trigger1 = !var(31)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(5) := enemynear, stateno
trigger1 = var(31) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(6)
trigger1 = !var(32)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(6) := enemynear, stateno
trigger1 = var(32) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(7)
trigger1 = !var(33)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(7) := enemynear, stateno
trigger1 = var(33) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(8)
trigger1 = !var(34)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(8) := enemynear, stateno
trigger1 = var(34) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(9)
trigger1 = !var(35)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(9) := enemynear, stateno
trigger1 = var(35) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(59)
trigger1 = !var(36)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(10) := enemynear, stateno
trigger1 = var(36) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(11)
trigger1 = !var(37)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(11) := enemynear, stateno
trigger1 = var(37) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(12)
trigger1 = !var(38)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(12) := enemynear, stateno
trigger1 = var(38) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(13)
trigger1 = !var(39)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(13) := enemynear, stateno
trigger1 = var(39) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(14)
trigger1 = !var(40)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(14) := enemynear, stateno
trigger1 = var(40) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(15)
trigger1 = !var(41)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(15) := enemynear, stateno
trigger1 = var(41) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(16)
trigger1 = !var(42)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(16) := enemynear, stateno
trigger1 = var(42) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(17)
trigger1 = !var(43)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(17) := enemynear, stateno
trigger1 = var(43) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(18)
trigger1 = !var(44)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(18) := enemynear, stateno
trigger1 = var(44) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(19)
trigger1 = !var(45)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(19) := enemynear, stateno
trigger1 = var(45) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(20)
trigger1 = !var(46)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(20) := enemynear, stateno
trigger1 = var(46) := enemynear, time
[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(21)
trigger1 = !var(47)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(21) := enemynear, stateno
trigger1 = var(47) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(22)
trigger1 = !var(48)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(22) := enemynear, stateno
trigger1 = var(48) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(23)
trigger1 = !var(49)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(23) := enemynear, stateno
trigger1 = var(49) := enemynear, time

[State 9743, AI Enemy Attack Frame Data]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
triggerall = enemynear, movecontact || enemynear, movereversed
trigger1 = !var(24)
trigger1 = !var(50)
trigger1 = enemynear, stateno != var(0)
trigger1 = enemynear, stateno != var(1)
trigger1 = enemynear, stateno != var(2)
trigger1 = enemynear, stateno != var(3)
trigger1 = enemynear, stateno != var(4)
trigger1 = enemynear, stateno != var(5)
trigger1 = enemynear, stateno != var(6)
trigger1 = enemynear, stateno != var(7)
trigger1 = enemynear, stateno != var(8)
trigger1 = enemynear, stateno != var(9)
trigger1 = enemynear, stateno != var(10)
trigger1 = enemynear, stateno != var(11)
trigger1 = enemynear, stateno != var(12)
trigger1 = enemynear, stateno != var(13)
trigger1 = enemynear, stateno != var(14)
trigger1 = enemynear, stateno != var(15)
trigger1 = enemynear, stateno != var(16)
trigger1 = enemynear, stateno != var(17)
trigger1 = enemynear, stateno != var(18)
trigger1 = enemynear, stateno != var(19)
trigger1 = enemynear, stateno != var(20)
trigger1 = enemynear, stateno != var(21)
trigger1 = enemynear, stateno != var(22)
trigger1 = enemynear, stateno != var(23)
trigger1 = enemynear, stateno != var(24)
trigger1 = var(24) := enemynear, stateno
trigger1 = var(50) := enemynear, time

[State 9743, AI Simple Storage]
type = null
triggerall = root,var(59) && roundstate = 2
triggerall = root,alive
triggerall = enemy, teammode != simul
triggerall = !(enemynear, hitdefattr = SCA,HA,HP,AT) && enemynear, movetype = A
trigger1 = enemynear, stateno = var(0)
trigger1 = var(58) := var(0) || 1
trigger1 = var(59) := var(25) || 1
trigger2 = enemynear, stateno = var(1)
trigger2 = var(58) := var(1) || 1
trigger2 = var(59) := var(26) || 1
trigger3 = enemynear, stateno = var(2)
trigger3 = var(58) := var(2) || 1
trigger3 = var(59) := var(27) || 1
trigger4 = enemynear, stateno = var(3)
trigger4 = var(58) := var(3) || 1
trigger4 = var(59) := var(28) || 1
trigger5 = enemynear, stateno = var(4)
trigger5 = var(58) := var(4) || 1
trigger5 = var(59) := var(29) || 1
trigger6 = enemynear, stateno = var(5)
trigger6 = var(58) := var(5) || 1
trigger6 = var(59) := var(31) || 1
trigger7 = enemynear, stateno = var(6)
trigger7 = var(58) := var(6) || 1
trigger7 = var(59) := var(32) || 1
trigger8 = enemynear, stateno = var(7)
trigger8 = var(58) := var(7) || 1
trigger8 = var(59) := var(33) || 1
trigger9 = enemynear, stateno = var(8)
trigger9 = var(58) := var(8) || 1
trigger9 = var(59) := var(34) || 1
trigger10 = enemynear, stateno = var(9)
trigger10 = var(58) := var(9) || 1
trigger10 = var(59) := var(35) || 1
trigger11 = enemynear, stateno = var(59)
trigger11 = var(58) := var(59) || 1
trigger11 = var(59) := var(36) || 1
trigger12 = enemynear, stateno = var(11)
trigger12 = var(58) := var(11) || 1
trigger12 = var(59) := var(37) || 1
trigger13 = enemynear, stateno = var(12)
trigger13 = var(58) := var(12) || 1
trigger13 = var(59) := var(38) || 1
trigger14 = enemynear, stateno = var(1)
trigger14 = var(58) := var(13) || 1
trigger14 = var(59) := var(39) || 1
trigger15 = enemynear, stateno = var(14)
trigger15 = var(58) := var(14) || 1
trigger15 = var(59) := var(40) || 1
trigger16 = enemynear, stateno = var(15)
trigger16 = var(58) := var(15) || 1
trigger16 = var(59) := var(41) || 1
trigger17 = enemynear, stateno = var(16)
trigger17 = var(58) := var(16) || 1
trigger17 = var(59) := var(42) || 1
trigger18 = enemynear, stateno = var(17)
trigger18 = var(58) := var(17) || 1
trigger18 = var(59) := var(43) || 1
trigger19 = enemynear, stateno = var(18)
trigger19 = var(58) := var(18) || 1
trigger19 = var(59) := var(44) || 1
trigger20 = enemynear, stateno = var(19)
trigger20 = var(58) := var(19) || 1
trigger20 = var(59) := var(45) || 1
trigger21 = enemynear, stateno = var(20)
trigger21 = var(58) := var(20) || 1
trigger21 = var(59) := var(46) || 1
trigger22 = enemynear, stateno = var(21)
trigger22 = var(58) := var(21) || 1
trigger22 = var(59) := var(47) || 1
trigger23 = enemynear, stateno = var(22)
trigger23 = var(58) := var(22) || 1
trigger23 = var(59) := var(48) || 1
trigger24 = enemynear, stateno = var(23)
trigger24 = var(58) := var(23) || 1
trigger24 = var(59) := var(49) || 1
trigger25 = enemynear, stateno = var(24)
trigger25 = var(58) := var(24) || 1
trigger25 = var(59) := var(50) || 1

;---------------------------------------------------------------------------
; AI Detect Projectile System
[Statedef 33333333]
type = A
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 9741

[state 33333333, Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "Highest Playerid = %d , Projectile helper's PlayerId = %d\nBy Inktrebuchet"
params = var(0)-1, var(4)

[State 33333333, 0]
type = Null
trigger1 = var(0) = 0
trigger1 = (var(0) := id)
ignorehitpause = 1

[state 33333333, 1] 
type = varadd
trigger1 = PlayerIdExist(var(0)) 
trigger2 = PlayerIdExist(var(0)+1) 
trigger3 = PlayerIdExist(var(0)+2) 
trigger4 = PlayerIdExist(var(0)+3) 
trigger5 = PlayerIdExist(var(0)+4) 
trigger6 = PlayerIdExist(var(0)+5) 
trigger7 = PlayerIdExist(var(0)+6) 
trigger8 = PlayerIdExist(var(0)+7) 
trigger9 = PlayerIdExist(var(0)+8) 
trigger10 = PlayerIdExist(var(0)+9) 
trigger11 = PlayerIdExist(var(0)+10) 
trigger12 = PlayerIdExist(var(0)+11) 
trigger13 = PlayerIdExist(var(0)+12) 
trigger14 = PlayerIdExist(var(0)+13) 
trigger15 = PlayerIdExist(var(0)+14) 
trigger16 = PlayerIdExist(var(0)+15) 
trigger17 = PlayerIdExist(var(0)+16) 
trigger18 = PlayerIdExist(var(0)+17) 
trigger19 = PlayerIdExist(var(0)+18) 
trigger20 = PlayerIdExist(var(0)+19) 
trigger21 = PlayerIdExist(var(0)+20) 
trigger22 = PlayerIdExist(var(0)+21) 
trigger23 = PlayerIdExist(var(0)+22) 
trigger24 = PlayerIdExist(var(0)+23) 
trigger25 = PlayerIdExist(var(0)+24) 
trigger26 = PlayerIdExist(var(0)+25) 
v = 0
value = 1
ignorehitpause = 1

[State 33333333, 2]
type = Null
triggerall = PlayerIdExist(Root,ID)
trigger1 = PlayerIdExist(var(0)-1)
trigger1 = IfElse(root,teamside = 1, PlayerID(var(0)-1),teamside = 2, PlayerID(var(0)-1),teamside = 1)
trigger1 = PlayerID(var(0)-1),hitdefattr = ASC, NP, SP, HP
trigger1 = var(4) := (var(0)-1)
trigger2 = PlayerIdExist(var(0)-2)
trigger2 = IfElse(root,teamside = 1, PlayerID(var(0)-2),teamside = 2, PlayerID(var(0)-2),teamside = 1)
trigger2 = PlayerID(var(0)-2),hitdefattr = ASC, NP, SP, HP
trigger2 = var(4) := (var(0)-2)
trigger3 = PlayerIdExist(var(0)-3)
trigger3 = IfElse(root,teamside = 1, PlayerID(var(0)-3),teamside = 2, PlayerID(var(0)-3),teamside = 1)
trigger3 = PlayerID(var(0)-3),hitdefattr = ASC, NP, SP, HP
trigger3 = var(4) := (var(0)-3)
trigger4 = PlayerIdExist(var(0)-4)
trigger4 = IfElse(root,teamside = 1, PlayerID(var(0)-4),teamside = 2, PlayerID(var(0)-4),teamside = 1)
trigger4 = PlayerID(var(0)-4),hitdefattr = ASC, NP, SP, HP
trigger4 = var(4) := (var(0)-4)
trigger5 = PlayerIdExist(var(0)-5)
trigger5 = IfElse(root,teamside = 1, PlayerID(var(0)-5),teamside = 2, PlayerID(var(0)-5),teamside = 1)
trigger5 = PlayerID(var(0)-5),hitdefattr = ASC, NP, SP, HP
trigger5 = var(4) := (var(0)-5)
trigger6 = PlayerIdExist(var(0)-6)
trigger6 = IfElse(root,teamside = 1, PlayerID(var(0)-6),teamside = 2, PlayerID(var(0)-6),teamside = 1)
trigger6 = PlayerID(var(0)-6),hitdefattr = ASC, NP, SP, HP
trigger6 = var(4) := (var(0)-6)
trigger7 = PlayerIdExist(var(0)-7)
trigger7 = IfElse(root,teamside = 1, PlayerID(var(0)-7),teamside = 2, PlayerID(var(0)-7),teamside = 1)
trigger7 = PlayerID(var(0)-7),hitdefattr = ASC, NP, SP, HP
trigger7 = var(4) := (var(0)-7)
trigger8 = PlayerIdExist(var(0)-8)
trigger8 = IfElse(root,teamside = 1, PlayerID(var(0)-8),teamside = 2, PlayerID(var(0)-8),teamside = 1)
trigger8 = PlayerID(var(0)-8),hitdefattr = ASC, NP, SP, HP
trigger8 = var(4) := (var(0)-8)
trigger9 = PlayerIdExist(var(0)-9)
trigger9 = IfElse(root,teamside = 1, PlayerID(var(0)-9),teamside = 2, PlayerID(var(0)-9),teamside = 1)
trigger9 = PlayerID(var(0)-9),hitdefattr = ASC, NP, SP, HP
trigger9 = var(4) := (var(0)-9)
trigger10 = PlayerIdExist(var(0)-10)
trigger10 = IfElse(root,teamside = 1, PlayerID(var(0)-10),teamside = 2, PlayerID(var(0)-10),teamside = 1)
trigger10 = PlayerID(var(0)-10),hitdefattr = ASC, NP, SP, HP
trigger10 = var(4) := (var(0)-10)
ignorehitpause = 1

[State 33333333, BindToRoot]
type = BindToRoot
trigger1 = PlayerIdExist(Root,ID)
time = 1
facing = 1
pos = 0,-2
ignorehitpause = 1

[State 33333333, DestroySelf]
type = DestroySelf
trigger1 = !root,var(59)
ignorehitpause = 1

;---------------------------------------------------------------------------
; Dash Jump (AI)
[Statedef 41]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, 1]
type = VelSet
trigger1 = prevstateno = 100 
x = const(velocity.runjump.fwd.x)
y = -5.5

;OK, I'm getting confused!!
[State 40, 4];¬ƒWƒƒƒ“ƒv
type = VelSet
trigger1 = AnimTime = 0
x = const(velocity.jump.fwd.x)*2
y = -5.5 ;This was, I mean IS Haruhi's Height for low jump

[State 40, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Fwd (AI)
[Statedef 42]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

;Dash Jump
[State 40, 1]
type = VarSet
triggerall = Time = 0
trigger1 = (PrevStateNo = 100 || PrevStateNo = 101) && sysvar(1) = 1
trigger2 = prevstateno = 100 && command = "holdfwd"
var(37) = 1

[State 40, 1]
type = VelSet
trigger1 = AnimTime = 0
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)

[State 40, 1]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y)

[State 40, 1]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(36) = 1
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)
y = -5.5

[State 40, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------------------------
;Beginning of the super jump
[Statedef 8010]
type = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 7000, VarSet]
type = VarSet
trigger1 = 1
v = 11
value = 1

[State 7000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 8011
ctrl = 1

;---------------------------------------------------------------------------------------------
;Super Jump
[Statedef 8011]
type = A
physics = A
ctrl = 1
anim = 6000
velset = 0,-13.3

[State 7001, VelAdd]
type = VelAdd
triggerall = Vel X <= 2.5
trigger1 = Anim != 6001
x = 0.60

[State 7001, VelSet]
type = VelSet
trigger1 = Anim = 6001
trigger1 = Time = [0,5]
x = 4

[State 7001, VelSet]
type = VelSet
trigger1 = Anim = 6002
trigger1 = Time = [0,5]
x = -3.5

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 0
trigger1 = Time = [0,4]
value = 6000

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 1
trigger1 = Time = [0,4]
value = 6001

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = -1
trigger1 = Time = [0,4]
value = 6002

[State 7001, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 9999,5

[State 7001, Explod]
type = Explod
trigger1 = Time = 0
ID = 474
anim = 6669
postype = p1
pos = 12, 60
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 2
scale = 0.9, 0.9

[State 7001, explod]
type = Explod
trigger1 = Time = 0
ID = 474
anim = 9016
postype = p1
pos = 0, 20
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 2
scale = 2, 2

[State 7001, Var Mute]
type = VarSet
trigger1 = Time = 0
v = 12
value = 1

;---------------------------------------------------------------------------
; AI Run
[Statedef 102]
type    = S
physics = S
anim = 100
ctrl = 0
sprpriority = 1

[State 100, 4]
type = PlaySnd
trigger1 = AnimELem = 3
trigger2 = AnimELem = 7
value = 8100,0

[State 102, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 102, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 102, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 102, 4]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = p2dist X<30
value = 0
ctrl = 1
