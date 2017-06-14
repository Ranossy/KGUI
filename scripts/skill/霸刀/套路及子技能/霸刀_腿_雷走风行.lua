---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ե�/��·���Ӽ���/�Ե�_��_���߷���.lua
-- ����ʱ��:	2016/8/4 15:52:58
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�Ṧ_����ͻ.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����Ṧ
-- ��������  :  ����ͻ
-- ����Ч��  :  ��ǰ���һ�ξ��룬ͬʱ���н�·���ϵĵ�������˺�������ѣ��Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageLevel = 1, nSpeed = 50, nCostMana = 125},
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		112,
		tSkillData[dwSkillLevel].nSpeed
	);

	skill.BindBuff(1, 11037, 1) --�������õ�����BUFF

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת

	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 1088);
	skill.SetNormalCoolDown(2, 1016);
	skill.SetCheckCoolDown(1, 444)
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana
	--skill.nCostManaBasePercent = 91;	-- �������ĵ�����
	--skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	--skill.nMaxRadius        = 25 * LENGTH_BASE;
	--skill.nAngleRange       = 32;
	--skill.nAreaRadius	=	25 * LENGTH_BASE;
	--����֡��
	--skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	--skill.nBulletVelocity = 0;
	--����ϵĸ���
	--skill.nBreakRate = 0;

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com