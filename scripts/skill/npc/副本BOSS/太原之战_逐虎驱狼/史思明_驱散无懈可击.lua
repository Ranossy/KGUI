---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_��ɢ��и�ɻ�.lua
-- ����ʱ��:	2014/10/13 15:33:08
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����¼�_��_��ɢ��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-6-19
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  �����¼�
-- ����Ч��  :  �������,��ɢ��Ч��,
------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		8342,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		8342,
		2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		8342,
		3
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		8342,
		4
	);
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

	-- skill.SetNormalCoolDown(1,7);

--������������-------

	--��������
--    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 20 * LENGTH_BASE;
	skill.nAngleRange = 256;
	skill.nAreaRadius = 20 * LENGTH_BASE;
	--����֡��
	--  skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
	--�ӵ��ٶ�
	--  skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
	--����ϵĸ���
	-- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;

	return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function Apply(dwCharacterID)

end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com