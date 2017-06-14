---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/屠龙六式打击五3.lua
-- 更新时间:	2017/2/23 15:36:13
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	npc.CastSkill(17401, 1)
	npc.AddBuff(npc.dwID, npc.nLevel, 11731, 1)		--打击六监控buff
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com