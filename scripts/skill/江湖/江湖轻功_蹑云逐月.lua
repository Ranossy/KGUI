---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�����Ṧ_��������.lua
-- ����ʱ��:	2014/11/20 16:45:12
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ǰ��.lua
-- ������    :  ����
-- ����ʱ��  :  2007-9-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǰ��
-- ����Ч��  :  ��ǰ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDashFrame = 10},
	{nDashFrame = 12},
	{nDashFrame = 14},
	{nDashFrame = 16},
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		tSkillData[dwSkillLevel].nDashFrame,
		80
	);
	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--���ƶ�ǽ
    skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 503);	--����1��GCD
	skill.SetNormalCoolDown(2, 88);
	skill.SetNormalCoolDown(3, 165);
	--skill.SetNormalCoolDown(4, 804); --����1��CD
	skill.SetCheckCoolDown(2, 804);	--ֻ��鲻�ߵ�CD
--	skill.SetCheckCoolDown(3, 836);	--ֻ��鲻�ߵ�CD

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64;
	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 1000;
	--Ӳֱ
	--skill.nStiffFrames		= 16

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
	if skill.dwLevel == 1 then
		player.AcquireAchievement(671)
	end
	if skill.dwLevel == 2 then
		player.AcquireAchievement(670)
	end
	if skill.dwLevel == 3 then
		player.AcquireAchievement(669)
	end
	if skill.dwLevel == 4 then
		player.AcquireAchievement(668)
		
		--��������ָ������
		local nQuestId = 13249
		local nQuestIndex = player.GetQuestIndex(nQuestId)
		local nQuestPhase = player.GetQuestPhase(nQuestId)
		if nQuestIndex and nQuestPhase == 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.SetQuestValue(nQuestIndex, 1, 1)
			player.SetQuestValue(nQuestIndex, 2, 1)
			player.SetQuestValue(nQuestIndex, 3, 1)
		end
	end	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com