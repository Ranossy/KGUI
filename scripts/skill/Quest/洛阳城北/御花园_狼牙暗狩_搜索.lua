---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/洛阳城北/御花园_狼牙暗狩_搜索.lua
-- 更新时间:	2016/9/16 22:34:20
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if not npc.bFightState then
		npc.CastSkill(16796, 1)
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if npc then
		npc.AddBuff(0, 99, 11240, 1, 1000)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com