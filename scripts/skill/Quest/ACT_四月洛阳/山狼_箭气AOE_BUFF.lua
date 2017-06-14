---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_四月洛阳/山狼_箭气AOE_BUFF.lua
-- 更新时间:	2016/4/14 19:30:24
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.CastSkill(15759, 1)
	--npc.PlaySfx(23, npc.nX, npc.nY, npc.nZ + 140)
	--npc.PlaySfx(99, npc.nX, npc.nY, npc.nZ)
	--npc.PlaySfx(137, npc.nX, npc.nY, npc.nZ)
	--player.PlaySfx(23, player.nX, player.nY, player.nZ)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com