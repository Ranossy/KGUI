---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/屠龙六式打击三监控.lua
-- 更新时间:	2017/2/23 18:57:25
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	npc.CastSkill(17406, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com