---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ACT_��������/ɽ��_����AOE_BUFF.lua
-- ����ʱ��:	2016/4/14 19:30:24
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
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

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com