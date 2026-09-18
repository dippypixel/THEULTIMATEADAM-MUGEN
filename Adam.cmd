; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1



;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "BASH0R"   ;Same name as above
command = ~D,DB,B, x+y
time = 20

[Command]
name = "BASH0R"   ;Same name as above
command = ~D,DB,B, y+z
time = 20

[Command]
name = "BASH0R"   ;Same name as above
command = ~D,DB,B, x+z
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, z+c ;~F, D, DF, F, D, DF, x
time = 20
[Command]
name = "Creeper"
command = ~D, F, D, B, z
time = 20
;-| Special Motions |------------------------------------------------------

[Command]
name = "CKblast"
command = ~D, DF, F, z
time = 20

[Command]
name = "MrSpickles"
command = ~D, DF, F, y
time = 20

[Command]
name = "GameBoy"
command = ~D, DF, F, x
time = 20

;[Command]
;name = "TabToss"
;command = ~D, DF, F, a
;time = 20

[Command]
name = "CUTCUTA"
command = ~D, DB, B, a
time = 20

[Command]
name = "CUTCUTB"
command = ~D, DB, B, b
time = 20

[Command]
name = "TrollBat"
command = ~D, DB, B, c
time = 20

[Command]
name = "PACADAM"
command = ~F, F, z
time = 20

[Command]
name = "TONYBAT"
command = ~D, DB, B, c+b
time = 20

[Command]
name = "Nepeta"
command = ~D, D, z
time = 25

[Command]
name = "Dodge1"
command = x+y+z
time = 1

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "down"
command = D
time = 1

[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdc";Required (do not remove)
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "HoldA"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;---------------------------------------------------------------------------
[Command]
name = "SUICIDE"
command = ~D,B,D,F, s
;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1, Imperitive]

[State AI Activation]
Type = Null
Trigger1=!var(59)
Trigger1=Var(59):=AILevel&&0
ignorehitpause = 1

[State -1, Disable Default Guarding]
type = AssertSpecial
trigger1 = var(59)>0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -1, Disable Default Walking]
type = AssertSpecial
trigger1 = var(59)>0
flag = nowalk
ignorehitpause = 1

[State -1, AI DMM-like Guarding System]
type=helper
trigger1=!NumHelper(9742)
trigger1=roundstate=2
trigger1=alive&&!ishelper
trigger1=var(59)
helpertype=normal
name="AI Guarding Helper"
stateno=9742
ID=9742
pos=9999,9999
keyctrl=0
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -1, AI DMM-like Counter Memory]
type=helper
trigger1=!NumHelper(9743)
trigger1=roundstate=2
trigger1=alive&&!ishelper
trigger1=var(59)
helpertype=normal
name="AI Counter Memory Helper"
stateno=9743
ID=9743
pos=9999,9999
keyctrl=0
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[state -1, AI Detect Projectile System]
type = helper
trigger1 = !numhelper(33333333)
trigger1=roundstate=2
trigger1=alive&&!ishelper
trigger1=var(59)
name = "AI Detect Projectile System"
ID = 33333333
stateno = 33333333
postype = p1
ownpal = 1
keyctrl = 0
size.xscale = 1.0
size.yscale = 1.0
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -1, Simul/Tag]
Type = varset
triggerall = !ishelper
trigger1 = numenemy = 1
var(57) = 0
ignorehitpause = 1

[State -1, Simul/Tag]
Type = varset
triggerall = !ishelper
trigger1 = numenemy = 2
trigger1 = enemynear(0),alive
trigger1 = enemynear(1),alive
var(57) = IfElse(((Abs(Pos X - EnemyNear(0),Pos X)) < (Abs(Pos X - EnemyNear(1),Pos X))),0,1)
ignorehitpause = 1

[State -1, Simul/Tag]
Type = varset
triggerall = !ishelper
trigger1 = numenemy = 2
trigger1 = !enemynear(0),Alive || !enemynear(1),Alive
var(57) = IfElse(EnemyNear(0),Alive,0,1)
ignorehitpause = 1

[State -1, Enemy X-Velocity]
type = varset
triggerall = !ishelper
triggerall = facing != enemynear(var(57)),facing
trigger1 = fvar(10) != enemynear(var(57)),vel x
fvar(10) = enemynear(var(57)),vel x 

[State -1, Enemy X-Velocity]
type = varset
triggerall = !ishelper
triggerall = facing = enemynear(var(57)),facing
trigger1 = fvar(10) != enemynear(var(57)),vel x
fvar(10) = -enemynear(var(57)),vel x 

[State -1, Enemy X-Velocity]
type = varset
triggerall = !ishelper
triggerall = fvar(10) != 0
trigger1 = enemynear(var(57)),vel x = 0
fvar(10) = 0
ignorehitpause = 1

[state -1, Yaccel]
type = varset
triggerall = !ishelper
trigger1 = fvar(12) != enemynear(var(57)),const(movement.yaccel)
trigger1 = enemynear(var(57)),stateno != [5000,5210]
trigger1 = enemynear(var(57)),vel y != 0
fv = 12
value = enemynear(var(57)),const(movement.yaccel)
ignorehitpause = 1

[state -1, Yaccel]
type = varset
triggerall = !ishelper
trigger1 = fvar(12) != enemynear(var(57)),gethitvar(yaccel)
trigger1 = enemynear(var(57)),stateno = [5000,5210]
fv = 12
value = enemynear(var(57)),gethitvar(yaccel)
ignorehitpause = 1

[state -1, Yaccel]
type = varset
triggerall = !ishelper
trigger1 = fvar(12) != 0
trigger1 = enemynear(var(57)),vel y = 0
fv = 12
value = 0
ignorehitpause = 1

[State -1, DMM Guarding Check (OFF)]
type = VarSet
triggerall = var(59) && numenemy
triggerall = numhelper(9742)
trigger1 = enemynear(var(57)), statetype != A
trigger1 = enemynear(var(57)), stateno != helper(9742),var(59) || enemynear(var(57)), stateno = 0
fvar(15) = 0

[State -1, DMM Guarding Check (ON)]
type = VarSet
triggerall = var(59) && numenemy
trigger1 = enemynear(var(57)), statetype = A
trigger2 = numhelper(9742)
trigger2 = enemynear(var(57)), stateno != 0
trigger2 = enemynear(var(57)), stateno = helper(9742),var(59)
fvar(15) = 1

[State -1, Projectile Alert]
type = explod
triggerall = var(59)>0
triggerall = ctrl || (stateno = [100,105]) || stateno = [120,140]
triggerall = statetype != A
triggerall = numhelper(33333333)
triggerall = numexplod(33330001) = 0
trigger1 = PlayerIdExist(helper(33333333),var(4))
trigger1 = PlayerID(helper(33333333),var(4)), pos y > -100
trigger1 = PlayerID(helper(33333333),var(4)), vel x != 0
trigger1 = ((PlayerId(helper(33333333),var(4)), p2bodydist x) + 1 * ((PlayerId(helper(33333333),var(4)), vel x) + 1)*.1 = [0,200]) && (PlayerID(helper(33333333),var(4)),movetype = A)
trigger1 = ((((PlayerID(helper(33333333),var(4)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(4)),const(size.ground.front)) / (PlayerId(helper(33333333),var(4)),vel x) > 0)
anim = helper(33333333), anim ; blank anim
ID = 33330001

[State -1, All Good!]
type = removeexplod
triggerall = numexplod(33330001) = 1
triggerall = numhelper(33333333)
trigger1 = var(59)<=0
trigger2 = RoundState > 2
trigger3 = enemynear(var(57)),movetype != A
trigger4 = movetype = H
trigger5 = statetype = A
trigger6 = !PlayerIdExist(helper(33333333),var(4))
trigger7 = PlayerIdExist(helper(33333333),var(4))
trigger7 = PlayerID(helper(33333333),var(4)), pos y <= -100 || PlayerID(helper(33333333),var(4)),movetype != A || (PlayerId(helper(33333333),var(4)), p2bodydist x) + 1 * ((PlayerId(helper(33333333),var(4)), vel x) + 1)*.1 < 0
ID = 33330001
ignorehitpause = 1

[State -1, AI Taunt]
type = ChangeState
value = 195
triggerall = AIlevel && numenemy
triggerall = !ishelper
triggerall = statetype != A
triggerall = roundstate = 3
triggerall = prevstateno != 195
triggerall = stateno != 195
trigger1 = enemy,life <= 0
trigger1 = ctrl

[State -1, Avoid Infinite]
type = VarSet
triggerall = AILevel && RoundState = 2 && var(32) = 0
triggerall = movetype != H
trigger1 = Stateno = 650 && movecontact
trigger2 = stateno = 820
var(32) = 1
ignorehitpause = 1

[State -1, Reset Infinite Variable]
type = VarSet
triggerall = var(32) > 0
trigger1 = !AILevel
trigger2 = RoundState > 2
trigger3 = movetype = H
trigger4 = !ctrl && stateno > 199 && Statetype != A && stateno != 820
var(32) = 0
ignorehitpause = 1

[State -1, BassCannon]
type = ChangeState
value = 3000
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = power >= 2000
trigger1 = ctrl && P2Dist Y = [-70,20]
trigger1 = enemynear(!enemynear,alive),vel y >= 0
trigger2 = stateno = 1000
trigger2 = movehit
;trigger3 = (stateno = [220,250])
;trigger3 = movehit

[State -1, CREEPER]
type = ChangeState
value = 3300
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3100]
trigger2 = movecontact

[State -1, combo]
type = ChangeState
value = 3200
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = enemynear(var(57)),stateno != [120,155]
triggerall = enemynear(!enemynear,alive),vel y >= 0
triggerall = p2bodydist x <= 60
triggerall = (p2statetype = S) || (p2statetype = C)
triggerall = P2Dist Y = [-50,20]
triggerall = power >= 1000
triggerall = power <= 1300
triggerall = enemynear(var(57)),statetype != L
trigger1 = (enemynear(var(57)),movetype != H)
triggerall = statetype != A
trigger1 = ctrl
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)
trigger2 = (stateno = [220,250]) || stateno = 420
trigger2 = movecontact

[State -1, CHEX QUEST]
type = ChangeState
value = 3100
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = enemynear(var(57)),stateno != [120,155]
triggerall = enemynear(!enemynear,alive),vel y >= 0
triggerall = p2bodydist x >= 60
triggerall = power >= 1000
triggerall = power <= 1300
triggerall = enemynear(var(57)),statetype != L
trigger1 = (enemynear(var(57)),movetype != H)
triggerall = statetype != A
trigger1 = ctrl && random <= var(59) * 30
trigger2 = (stateno = [220,250]) || stateno = 420
trigger2 = movecontact

[State -1, AI Jump]
type = ChangeState
value = 42
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A && !inguarddist && enemynear(var(57)),movetype != A
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
triggerall = prevstateno != 810
triggerall = prevstateno != 3201
triggerall = !NumHelper(31675)
triggerall = enemynear(var(57)),statetype != L
trigger1 = (enemynear(var(57)),movetype != H) && enemynear(var(57)),statetype = A
trigger1 = random <= var(59) * 3 && p2bodydist x >= 100
trigger2 = ((p2bodydist x = [0,80]) || (frontedgedist <= 30)) && enemynear(var(57)),statetype = A && (enemynear(var(57)),stateno != [5200,5299]) && (enemynear(var(57)),stateno != [120,155])
trigger2 = (abs(enemynear(var(57)),vel x) <= 4) && (enemynear(var(57)),pos y <= -40 || enemynear(var(57)),vel y < 0) && p2bodydist y >= -100
trigger2 = random <= var(59) * 30
trigger3 = numexplod(33330001)
trigger4 = enemynear(var(57)),movetype = H && enemynear(var(57)),statetype = A && p2bodydist x <= 60
trigger4 = enemynear(var(57)),vel y <= -2
[State -1, AI Guard]
type = ChangeState
value = 120
triggerall = var(59) && !ishelper && roundstate = 2
triggerall = alive
triggerall = ctrl || (stateno = [21,22]) || stateno = [100,105]
triggerall = stateno != [120,155]
triggerall = enemynear(var(57)),hitdefattr != SCA,AT
trigger1 = inguarddist
ctrl = 0

[State -1, Kung Fu Throw]
type = ChangeState
value = 820
triggerall = ailevel
triggerall = statetype = S
triggerall = ctrl
triggerall = enemynear(var(57)),movetype != H
triggerall = stateno != 100
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

[State -1, Dash]
type = ChangeState
value = 102
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = p2dist X>30
triggerall = stateno != 102
triggerall = ctrl || (stateno = [22,23]) || 0
trigger1 = enemynear,stateno = 2593  && p2bodydist x >= 130
[State -1, Dash]
type = ChangeState
value = 102
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A && enemynear(!enemynear,alive),statetype != L && enemynear(!enemynear,alive),stateno != [5200,5210]
triggerall = pos y = 0
triggerall = stateno != 102
triggerall = p2dist y >= 0
triggerall = p2dist X>30
triggerall = ctrl || (stateno = [22,23]) || 0
trigger1 = random <= var(59) * 20
trigger1 = enemynear(!enemynear,alive),movetype != H
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)
trigger2 = !enemynear(!enemynear,alive),hitfall
trigger2 = enemynear(!enemynear,alive),gethitvar(hittime) >= 13
trigger3 = enemynear(!enemynear,alive),movetype = H
trigger4 = enemynear(var(57)),stateno = 2593

[State -1, AI Light Attack]
type = ChangeState
value = 200
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = enemynear(var(57)),statetype != L
triggerall = prevstateno != 3201
triggerall = P2Dist Y = [-50,20]
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = p2bodydist X <= 30 && P2Dist X >= 0
trigger1 = random <= var(59) * 99
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)
trigger2 = numhelper(9743)
trigger2 = (enemynear(var(57)),stateno != [0,199]) && enemynear(var(57)),ctrl = 0 && enemynear(var(57)),time <= helper(9743),var(59)-4 && enemynear(var(57)),movetype != H
trigger2 = enemynear(var(57)), stateno = helper(9743),var(58)
trigger3 = prevstateno = 31672 && p2bodydist X <= 40 && (enemynear(var(57)),movetype = H)
[State -1, AI Dash Back]
type = ChangeState
value = 105
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = backedgebodydist >= 40
triggerall = prevstateno != 3201
triggerall = P2Dist Y = [-40,20]
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
triggerall = p2bodydist X <= 30 && P2Dist X >= 0
trigger1 = enemynear(var(57)),statetype = L
[State -1, AI 1000]
type = ChangeState
value = 1000
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = enemynear(var(57)),statetype != L
triggerall = prevstateno != 1020
triggerall = !numexplod(33330001)
triggerall = prevstateno != 3201
triggerall = stateno != 102
triggerall = P2Dist Y = [-40,20]
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = p2bodydist X <= 70 && P2Dist X >= 0
trigger1 = p2bodydist X >= 30
trigger1 = random <= var(59) * 50
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)
trigger2 = numhelper(9743)
trigger2 = (enemynear(var(57)),stateno != [0,199]) && enemynear(var(57)),ctrl = 0 && enemynear(var(57)),time <= helper(9743),var(59)-5 && enemynear(var(57)),movetype != H
trigger2 = enemynear(var(57)), stateno = helper(9743),var(58)
[State -1, AI 1000]
type = ChangeState
value = 1010
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = enemynear(var(57)),statetype != L
trigger1 = stateno = 1000 && movecontact
[State -1, AI 1000]
type = ChangeState
value = 1020
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = P2Dist Y = [-50,20]
triggerall = enemynear(var(57)),statetype != L
trigger1 = stateno = 1010 && moveguarded
[State -1, AI 1000]
type = ChangeState
value = 1022
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = enemynear(var(57)),statetype != L
trigger1 = stateno = 1020 && movehit && power >= 1000

[State -1, AI Nepeta]
type = ChangeState
value = ifelse(power>=1000 && power <= 1500,3100,1100)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = !NumHelper(833)
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = enemynear(var(57)),statetype = L
trigger1 = p2bodydist X >= 50  && p2bodydist X <= 200
trigger2 = prevstateno = 3201 && p2bodydist X >= 50
;trigger3 = enemynear(var(57)),stateno = 816

[State -1, AI Commander Keen]
type = ChangeState
value = 4332
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall =!NumHelper(31675)
triggerall = P2Dist Y = [-40,20]
triggerall = enemynear(var(57)),stateno != [120,155]
triggerall = power >= 500
triggerall = power <= 1850
triggerall = P2stateno != 2593
triggerall = Target,Stateno != 2593
triggerall = enemynear(var(57)),vel y < 3
triggerall = prevstateno != 3201
triggerall = prevstateno != 1020
triggerall = enemynear(var(57)),statetype != C
triggerall = enemynear(var(57)),statetype != L
triggerall = enemynear(var(57)),stateno != 5120
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = p2bodydist X >= 20 && P2Dist X >= 0
trigger1 = random <= var(59) * 50
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)

[State -1, AI Gameboy]
type = ChangeState
value = 31672
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = Target,Stateno != 2593
triggerall = !NumHelper(31675)
triggerall = P2Dist Y = [-40,20]
triggerall = enemynear(var(57)),statetype!=A
triggerall = prevstateno != 3201
triggerall = enemynear(var(57)),statetype != L
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = p2bodydist X <= 100 && P2Dist X >= 0
trigger1 = random <= var(59) * 99
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)

[State -1, AI Mr Spickles]
type = ChangeState
value = 31673
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A
triggerall = Target,Stateno != 2593
triggerall = enemynear(var(57)),statetype!=A
triggerall = prevstateno != 3201
triggerall =!NumHelper(31674)
triggerall = !numexplod(33330001)
;triggerall = enemynear(var(57)),statetype != L
triggerall = P2Dist Y = [-40,20]
triggerall = (ctrl||(stateno=[21,22])||(stateno=[100,105])||(stateno=[120,140]))
trigger1 = p2bodydist X >= 100 && P2Dist X >= 0
trigger1 = random <= var(59) * 99
trigger1 = (!inguarddist || facing = enemynear(!enemynear,alive), facing)

[State -1, AI Dash Jump]
type = ChangeState
value = 41
triggerall = var(59) && !ishelper && roundstate = 2 ;&& !var(32)
triggerall = alive
triggerall = prevstateno != 3201
triggerall = enemynear(var(57)),statetype != A
triggerall = statetype != A
triggerall = !numexplod(33330001)
triggerall = prevstateno != 31672
triggerall = enemynear(var(57)),stateno != [120,155];avoid mvc guardpush loops
triggerall = p2bodydist X >= 30
triggerall = ctrl || (stateno = [21,22]) || stateno = [100,105]
triggerall = stateno != [120,155]
trigger1 = !inguarddist && enemynear(var(57)),movetype != H 
trigger1 = random <= var(59) * 40
trigger2 = numHelper(31674) && enemynear(var(57)),movetype = H
trigger3 = numHelper(31675) && enemynear(var(57)),movetype = H
trigger4 = Helper(833),movehit && enemynear(var(57)),movetype = H
trigger5 = enemynear,stateno = 2593 && p2bodydist x <= 130
[State -1, AI Air Light Attack]
type = ChangeState
value = ifelse(p2bodydist x >= 30,610,630)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A
triggerall = prevstateno = 42 || (stateno=[120,140])
triggerall = enemynear(var(57)),statetype != L
triggerall = p2bodydist x < 50 && P2Dist X >= 0
triggerall = (p2bodydist y = [-50,100])
trigger1 = random <= var(59) * 80
trigger2 = p2movetype = H && enemynear(var(57)),gethitvar(hittime) >= 3
trigger3 = numhelper(9743)
trigger3 = (enemynear(var(57)),stateno != [0,199]) && enemynear(var(57)),ctrl = 0 && enemynear(var(57)),time <= helper(9743),var(59)-3 && enemynear(var(57)),movetype != H
trigger3 = enemynear(var(57)), stateno = helper(9743),var(58)
[State -1, AI Air Light Attack]
type = ChangeState
value = 610
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A
triggerall = stateno = 8011
triggerall = p2bodydist x <= 40
triggerall = P2Dist Y = [-130-floor(10*(enemynear(!enemynear,alive),vel y)+(10*(10+1)/2)*fvar(10)-floor(10*vel y)-(10*(10+1)/2)*0.47),80-floor(10*(enemynear(!enemynear,alive),vel y)+(10*(10+1)/2)*fvar(10)-floor(10*vel y)-(10*(10+1)/2)*0.47)]
trigger1 = random <= var(59) * 80
[State -1, AI Air Light Attack]
type = ChangeState
value = 630
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A
triggerall = prevstateno = 41 || (stateno=[120,140]) || stateno = 110 && AnimElem>= 3
triggerall = enemynear(var(57)),statetype != L
trigger1 = p2bodydist x < 30 && P2Dist X >= 0
triggerall = enemynear(var(57)),statetype != A
[State -1, AI Air Light Attack]
type = ChangeState
value = 620
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A
triggerall = prevstateno = 41 || (stateno=[120,140])
triggerall = enemynear(var(57)),statetype != L
triggerall = p2bodydist x < 50 && P2Dist X >= 0
triggerall = (p2bodydist y = [-50,100])
trigger1 = numhelper(9743)
trigger1 = (enemynear(var(57)),stateno != [0,199]) && enemynear(var(57)),ctrl = 0 && enemynear(var(57)),time <= helper(9743),var(59)-3 && enemynear(var(57)),movetype != H
trigger1 = enemynear(var(57)), stateno = helper(9743),var(58)

[State -1, AI Aerial Rave]
type = ChangeState
value = ifelse((enemynear(var(57)),statetype!=A),640,610)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A 
trigger1 = stateno = 630 && movecontact
[State -1, AI Aerial Rave]
type = ChangeState
value = 640
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A 
trigger1 = stateno = 610 && movecontact
[State -1, AI Aerial Rave]
type = ChangeState
value = 620
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A 
trigger1 = stateno = 640 && movecontact
[State -1, AI Aerial Rave]
type = ChangeState
value = 650
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype = A 
trigger1 = stateno = 620 && movecontact

[State -1, AI Ground Combo]
type = ChangeState
value = 230
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 200 && movecontact  && gametime%2 = 0
[State -1, AI Ground Combo]
type = ChangeState
value = 210;theres 0 differences between the close and far med punch
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 200 && movecontact && gametime%2 = 1
[State -1, AI Ground Combo]
type = ChangeState
value = IfElse(P2BodyDist X > 28,220,221)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 210 && movecontact && prevstateno = 200
[State -1, AI Ground Combo]
type = ChangeState
value = 210
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 230 && movecontact && prevstateno = 200
[State -1, AI Ground Combo]
type = ChangeState
value = 240;theres 0 differences between the close and far med kick
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 210 && movehit && prevstateno = 230
[State -1, AI Gameboy Guard];The Gameboy has a ton of advantage.
type = ChangeState
value = 31672
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
triggerall = !NumHelper(31675)
trigger1 = stateno = 210 && moveguarded && prevstateno = 230

[State -1, AI Ground Combo]
type = ChangeState
value = ifelse(power>=500,4332,420)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 220 && movehit
[State -1, AI Ground Combo]
type = ChangeState
value = 31672
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
triggerall = !NumHelper(31675)
trigger1 = stateno = 220 && moveguarded

[State -1, AI Ground Combo]
type = ChangeState
value = ifelse(power>=1000,4332,420)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 240 && movecontact

[State -1, AI Ground Combo]
type = ChangeState
value = 1000
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = stateno = 420 && moveguarded && animtime = 0

[State -1, AI Ground Combo]
type = ChangeState
value = ifelse(NumHelper(31675),31672,31673)
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = (stateno = 221) && movecontact && animtime = 0

[State -1, AI Ground Combo]
type = ChangeState
value = ifelse(moveguarded&&!NumHelper(31675),31672,ifelse(power>=1500&&gametime%2=1,4332,420))
triggerall = var(59)>0 && roundstate = 2 && alive && numenemy
triggerall = statetype != A 
trigger1 = (stateno = 221) && movecontact
[State -1, Super Jump]
type = ChangeState
value = 8010
triggerall = ailevel
trigger1 = stateno = 420 && movehit

;------------------------------------------------------------------

;Recharge
[State -1, Recharge]
type = ChangeState
value = 197
triggerall = !var(45)
triggerall = !ailevel
triggerall = (command = "holdy" && command = "holdb")
triggerall = statetype != A
triggerall = power < 3000
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = STATENO=450 && movehit && time >10
[State -1, CREEPER]
type = ChangeState
value = 3300
triggerall = !ailevel
triggerall = command = "Creeper"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3100]
trigger2 = movecontact

[State -1, Chex Quest ftw]
type = ChangeState
value = 3100
triggerall = !ailevel
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100]
trigger2 = movecontact

[State -1, ];TonyBat
type = ChangeState
value = 1022
triggerall = !ailevel
triggerall = command = "TONYBAT"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = NumHelper(1023) = 0
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 1000&& movecontact
trigger9 = stateno = 1010&& movecontact


[State -1, Basher]
type = ChangeState
value = 3200
triggerall = !ailevel
triggerall = command = "BASH0R"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA

[State -1, BassCannon]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = var(1) ;Use combo condition (above
trigger1 = ctrl
trigger2 = stateno = 1000
trigger2 = movecontact

;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Chex Quest ftw]
type = ChangeState
value = 3100
triggerall = !ailevel
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100]
trigger2 = movecontact

;---------------------------------------------------------------------------
;BASS CANNON!!!
[State -1, BassCannon]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = var(1) ;Use combo condition (above
trigger1 = ctrl
trigger2 = stateno = 1000
trigger2 = movecontact



;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
var(1) = 1

;---------------------------------------------------------------------------
;commander keens gun
[State -1, commander keens gun]
type = ChangeState
value = 4332
triggerall = !ailevel && !var(35)
triggerall = command = "CKblast"
triggerall = power >= 500
triggerall = P2stateno != 2593
triggerall = Target,Stateno != 2593
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;TONY
[State -1, ];TonyBat
type = ChangeState
value = 1022
triggerall = command = "TONYBAT"
triggerall = !ailevel
triggerall = power >= 1000
triggerall = statetype != A
triggerall = NumHelper(1023) = 0
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 1000&& movecontact
trigger9 = stateno = 1010&& movecontact
;---------------------------------------------------------------------------
;commander keens gun in the Air 0_o
[State -1, Keen's Gun Down]
type = ChangeState
value = 4333
triggerall = !ailevel && !var(35)
triggerall = command = "holddown"
triggerall = command = "z"
triggerall = !ailevel
triggerall = power >= 500
triggerall = statetype = A
triggerall = P2stateno != 2593
triggerall = Target,Stateno != 2593
trigger1 = (StateNo = [600,699]) && MoveContact ;Use combo condition (above)
trigger2 = ctrl

;--------------------------------

[State -1, NEPETA STRIKE]
type = ChangeState
value = 1100
triggerall = command = "Nepeta"
triggerall = !ailevel
triggerall = !NumHelper(833)
trigger1 = var(1)
;---------------------------------------------------------------------------
;Spickles Toss
[State -1, Spickles Toss]
type = ChangeState
value = 31673
triggerall = !var(34)
triggerall = command = "MrSpickles"
triggerall = P2stateno != 2593
triggerall = !ailevel
triggerall = Target,Stateno != 2593
triggerall =!NumHelper(31674)
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Gameboy Throw
[State -1, Gameboy Throw]
type = ChangeState
value = 31672
triggerall = !var(34)
triggerall = command = "GameBoy"
triggerall = !ailevel
triggerall = P2stateno != 2593
triggerall = Target,Stateno != 2593
triggerall =!NumHelper(31675)
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;TabToss
;[State -1, TabToss]
;type = ChangeState
;value = 33494
;triggerall = command = "TabToss"
;triggerall = P2stateno != 2593
;triggerall = Target,Stateno != 2593
;triggerall =!NumHelper(31675)
;trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Special1
[State -1, CUT CUT];CUT CUT
type = ChangeState
value = 1000
triggerall = command = "CUTCUTA"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr=sc,na&& movecontact
trigger2 = stateno!= 1000
;---------------------------------------------------------------------------
;Special2
[State -1, CUT CUT];CUT CUT
type = ChangeState
value = 1010
triggerall = command = "CUTCUTB"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr=sc,na&& movecontact
trigger2 = stateno!= 1010
trigger3 = stateno = 1000 && movecontact&&time>15

;---------------------------------------------------------------------------
;Special3
[State -1,TrollBat ];TrollBat
type = ChangeState
value = 1020
triggerall = command = "TrollBat"
triggerall = !ailevel
triggerall = statetype != A
triggerall = NumHelper(1021) = 0
trigger1 = ctrl
trigger2 = hitdefattr=sc,na
TRIGGER2 =movecontact
trigger3 = stateno = 1000&& movecontact
trigger4 = stateno = 1010&& movecontact

;---------------------------------------------------------------------------
;PACADAM
[State -1, ];PACADAM
type = ChangeState
value = 334112
triggerall = !ailevel
triggerall = !var(33)
triggerall = command = "PACADAM"
triggerall = statetype != A && stateno!=334112
trigger1 = ctrl
trigger2 = hitdefattr=SC,NA
trigger2 = movecontact
trigger3 = stateno = 1020 && movecontact

;---------------------------------------------------------------------------
;dodge 1
[State -1, Dodge1]
type = ChangeState
value = 80053
triggerall = !ailevel
triggerall = command = "Dodge1"
triggerall = power >= 10
triggerall = statetype != A
trigger1 = ctrl ;Use combo condition (above)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ailevel
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !ailevel
triggerALL = command = "BB"
triggerALL = statetype != L
trigger1 = ctrl
trigger2=stateno=1010&&movehit && animelemtime(6)>10
trigger3 = STATENO=450 && movehit && time >10
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Air Dash]
type = ChangeState
value = 110
triggerall = !ailevel
triggerall = command = "FF"
triggerall = statetype = A
triggerall = StateNo != 110
trigger1 = ctrl

;---------------------------------------------------------------------------
;Kung Fu Throw
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = !ailevel
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 55*const(size.xscale)
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 55*const(size.xscale)
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
;Kung Fu Throw
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 820
triggerall = !ailevel
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H


;-----------------------------
[State -1, X]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "x"
trigger1 = Statetype = A && ctrl
trigger2 = stateno = 105 && time > 4
trigger3 = StateNo = 600 && MoveContact

;-----------------------------
[State -1, Y]
type = ChangeState
value = 610
triggerall = !ailevel
triggerall = command = "y"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact) && time > 2
trigger3 = (StateNo = 630) && (Movecontact) && time > 2
trigger4 = stateno = 105 && time > 4

;-----------------------------
[State -1, Z]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = !ailevel
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact) && time > 2
trigger3 = (StateNo = 630) && (Movecontact) && time > 2
trigger4 = (StateNo = 610) && (Movecontact) && time > 2
trigger5 = (StateNo = 640) && (Movecontact) && time > 2
trigger6 = stateno = 105 && time > 4

;-----------------------------
[State -1, B]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = !ailevel
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = (StateNo = 610) && (Movecontact)
trigger4 = (StateNo = 630) && (Movecontact)
trigger5 = stateno = 105 && time > 4

;-----------------------------
[State -1, C]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = !ailevel
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = (StateNo = 610) && (Movecontact)
trigger4 = (StateNo = 620) && (Movecontact)
trigger5 = (StateNo = 630) && (Movecontact)
trigger6 = (StateNo = 640) && (Movecontact)
trigger7 = stateno = 105 && time > 4

;-----------------------------
[State -1, A]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = !ailevel
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = stateno = 105 && time > 4

;-----------------------------
[State -1, X agachado]
type = ChangeState
value = 400
triggerall = !ailevel
triggerall = Command = "x"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 400) && (MoveContact)
Trigger5 = (StateNo = 400) && (Time > 3)

;-----------------------------
[State -1, X]
type = ChangeState
value = 200
triggerall = !ailevel
triggerall = Command = "x"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = Stateno = 200 ||stateno=334112&&animelemtime(11)>0
trigger2= MoveContact
trigger3 = Stateno = 200 && Time > 5

;-----------------------------

[State -1, Y agachado]
type = ChangeState
value = 410
triggerall = !ailevel
triggerall = Command = "y"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 400) && (Movecontact)
trigger5 = (StateNo = 430) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)

;-----------------------------

[State -1, Y]
type = ChangeState
value = IfElse(P2BodyDist X > 28,210,211)
triggerall = !ailevel
triggerall = Command = "y"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact) && time > 3

;-----------------------------

[State -1, Z]
type = ChangeState
value = IfElse(P2BodyDist X > 28,220,221)
triggerall = !ailevel
triggerall = Command = "z"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact) && time > 3
trigger4 = (StateNo = 210) && (Movecontact) && time > 3
trigger5 = (StateNo = 211) && (Movecontact) && time > 3
trigger6 = (StateNo = 240) && (Movecontact) && time > 3
trigger7 = (StateNo = 241) && (Movecontact) && time > 3

;-----------------------------

[State -1, C]
type = ChangeState
value = 250
triggerall = !ailevel
triggerall = Command = "c"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 210) && (Movecontact)
trigger5 = (StateNo = 211) && (Movecontact)
trigger6 = (StateNo = 240) && (Movecontact)
trigger7 = (StateNo = 241) && (Movecontact)
trigger8 = (StateNo = 221) && (Movecontact)
trigger9 = (StateNo = 220) && (Movecontact)

;-----------------------------

[State -1, Z agachado]
type = ChangeState
value = 420
triggerall = !ailevel
triggerall = Command = "z"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 400) && (Movecontact)
trigger5 = (StateNo = 430) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 240) && (Movecontact)
trigger9 = (StateNo = 241) && (Movecontact)
trigger10 = (StateNo = 220) && (Movecontact)
trigger11 = (StateNo = 221) && (Movecontact)
trigger12 = (StateNo = 410) && (Movecontact)
trigger13 = (StateNo = 440) && (Movecontact)
trigger14 = (StateNo = 430) && (Movecontact)
trigger15 = (Stateno = 250) && (MoveContact)
trigger16 =stateno=334112&&animelemtime(11)>0&& (MoveContact)

;-----------------------------

[State -1, A agachado]
type = ChangeState
value = 430
triggerall = !ailevel
triggerall = Command = "a"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (Stateno = 200) && (Movecontact)
trigger3 = (Stateno = 230) && (Movecontact)
trigger4 = (Stateno = 400) && (Movecontact)

;-----------------------------

[State -1, taunt]
type = ChangeState
value = 195
triggerall = !ailevel
triggerall = Command = "start"
triggerall = Command != "holddown"
triggerall = stateno != 100
trigger1 = (StateType = S) && (Ctrl)

;-----------------------------

[State -1, A]
type = ChangeState
value = 230
triggerall = !ailevel
triggerall = Command = "a"
triggerall = Command != "holddown"
triggerall = stateno != 100
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (Stateno = 200) && (Movecontact)

;-----------------------------

[State -1, B]
type = ChangeState
value = 240
triggerall = !ailevel
triggerall = Command = "b"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 210) && (Movecontact)
trigger5 = (StateNo = 211) && (Movecontact)

;-----------------------------

[State -1, B agachado]
type = ChangeState
value = 440
triggerall = !ailevel
triggerall = Command = "b"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 400) && (Movecontact)
trigger5 = (StateNo = 430) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 240) && (Movecontact)
trigger9 = (StateNo = 241) && (Movecontact)
trigger10 = (StateNo = 220) && (Movecontact)
trigger11 = (StateNo = 221) && (Movecontact)
trigger12 = (StateNo = 410) && (Movecontact)

;-----------------------------

[State -1, C agachado]
type = ChangeState
value = 450
triggerall = !ailevel
triggerall = Command = "c"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 400) && (Movecontact)
trigger5 = (StateNo = 430) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 250) && (Movecontact)
trigger9 = (StateNo = 251) && (Movecontact)
trigger10 = (StateNo = 420) && (Movecontact)
trigger11 = (StateNo = 421) && (Movecontact)
trigger12 = (StateNo = 410) && (Movecontact)
trigger13 = (StateNo = 440) && (Movecontact)
;-----------------------------
[State -1, Super Jump]
type = ChangeState
value = 8000
triggerall = !ailevel
triggerall = Command = "holdup"
trigger1 = stateno = 420 && movehit

;---------------------------------------------------------------------------

