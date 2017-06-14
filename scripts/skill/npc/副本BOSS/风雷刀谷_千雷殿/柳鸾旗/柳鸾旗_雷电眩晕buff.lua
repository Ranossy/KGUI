---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_雷电眩晕buff.lua
-- 更新时间:	2017/2/27 15:37:37
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if playertarget then
		if playertarget.nMoveState ~= MOVE_STATE.ON_HALT then
			playertarget.DelBuff(11556, 1)
			playertarget.DelBuff(11556, 2)
		end
	end

	local npctarget = GetNpc(dwCharacterID)
	if npctarget then
		if npctarget.nMoveState ~= MOVE_STATE.ON_HALT then
			npctarget.DelBuff(11556, 1)
			npctarget.DelBuff(11556, 2)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com