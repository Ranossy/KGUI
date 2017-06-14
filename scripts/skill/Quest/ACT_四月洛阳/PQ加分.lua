---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_四月洛阳/PQ加分.lua
-- 更新时间:	2016/4/27 15:25:30
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc.bFightState then
		return
	end

	npc.CastSkill(15866, 1)
	npc.PlaySfx(386, npc.nX, npc.nY, npc.nZ + 140)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com