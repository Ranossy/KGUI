---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/���г����ʧ.lua
-- ����ʱ��:	2017/2/16 14:22:20
-- �����û�:	DELL01505071721
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
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
					npc.CastSkill(17364, 2)--���д���˺�
					npc.DoAction(0, 10060)
					playertarget.AddBuff(npc.dwID, npc.nLevel, 11705, 1)
				else
					npc.CastSkill(17388, 2)--�����޴���˺�
					npc.DoAction(0, 10061)
					playertarget.AddBuff(npc.dwID, npc.nLevel, 11705, 1)
				end
			end
		end

		if TargetType == TARGET.NPC then
			local npctarget = GetNpc(TargetID)
			if npctarget then
				if  npctarget.GetOTActionState() == 1 or npctarget.GetOTActionState() == 2 then --�ж�NPC�Ƿ���ʩ��״̬
					npc.CastSkill(17364, 2)--���д���˺�
					npc.DoAction(0, 10060)
				else
					npc.CastSkill(17388, 2)--�����޴���˺�
					npc.DoAction(0, 10061)
				end
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com