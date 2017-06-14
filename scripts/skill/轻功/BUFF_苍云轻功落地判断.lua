---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/BUFF_苍云轻功落地判断.lua
-- 更新时间:	2014/9/24 16:27:58
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
end
--
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_JUMP then
	--	player.CastSkill(13202, 1)	--	player.PlaySfx(30,0,0,0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com