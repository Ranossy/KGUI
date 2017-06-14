---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������/������ͨ����.lua
-- ����ʱ��:	2017/3/28 14:33:47
-- �����û�:	zhangkaiyuan-PC
-- �ű�˵��:
----------------------------------------------------------------------<
--������Ե������� ǧ������ һͳ����
--�书����
--NPC-��ͨ����
--����Ч����˵����NPC��ͨ��������
--����	2007-5-23

--------------����ķָ���-----------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/������/������ͨ����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 4.0 * LENGTH_BASE;
	skill.nAngleRange = 128;
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwSkillSrcID)
	if not npc then
		return
	end
	npc.nCurrentLife = npc.nCurrentLife - 0.1*npc.nMaxLife 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com