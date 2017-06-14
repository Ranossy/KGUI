---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/风切冲锋消失.lua
-- 更新时间:	2017/2/16 14:22:20
-- 更新用户:	DELL01505071721
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if npc then
		local TargetType, TargetID = npc.GetTarget()
		if TargetType == TARGET.PLAYER then
			local playertarget = GetPlayer(TargetID)
			if playertarget then
				if playertarget.GetOTActionState() == 1 or playertarget.GetOTActionState() == 2 then
					npc.CastSkill(17364, 2)--风切打断伤害
					npc.DoAction(0, 10060)
					playertarget.AddBuff(npc.dwID, npc.nLevel, 11705, 1)
				else
					npc.CastSkill(17388, 2)--风切无打断伤害
					npc.DoAction(0, 10061)
					playertarget.AddBuff(npc.dwID, npc.nLevel, 11705, 1)
				end
			end
		end

		if TargetType == TARGET.NPC then
			local npctarget = GetNpc(TargetID)
			if npctarget then
				if  npctarget.GetOTActionState() == 1 or npctarget.GetOTActionState() == 2 then --判断NPC是否处于施法状态
					npc.CastSkill(17364, 2)--风切打断伤害
					npc.DoAction(0, 10060)
				else
					npc.CastSkill(17388, 2)--风切无打断伤害
					npc.DoAction(0, 10061)
				end
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com