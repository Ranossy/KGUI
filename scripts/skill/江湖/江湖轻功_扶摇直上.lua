---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�����Ṧ_��ҡֱ��.lua
-- ����ʱ��:	2017/3/19 16:22:15
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{},
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�����Ṧ_��ҡֱ��.lua",
		0
	);
	skill.AddSlowCheckSelfBuff(1900, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	--�����з�ҡֱ��
	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--���ƶ�ǽ
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1298,
		1
	); 				--��������˲��Ϸɵ�Buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1299,
		1
	); 				--������˹Ȳ��Ϸɵ�Buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1691,
		1
	); 				--���������˲��Buff��20100522 ʧ�ܵ�man�޸�

	-- ��������Buff--�����£����Ṧ

	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 503);	--����1��GCD
	skill.SetNormalCoolDown(2, 204);
	skill.SetCheckCoolDown(1, 804);	--ֻ��鲻�ߵ�CD  ����

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

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--��ҡ���������
	local lv = player.GetSkillLevel(9002)
	if lv ~= 0 then
		player.AddBuff(player.dwID, player.nLevel, 208, lv, 30)
	end
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 1 then
		player.AcquireAchievement(704)
	end
	if skill.dwLevel == 4 then
		player.AcquireAchievement(73)
	end
	if skill.dwLevel == 11 then
		player.AcquireAchievement(74)
	end

	--��������ָ������
	local nQuestId = 13247
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
		if skill.dwLevel == 11 then
			player.SetQuestValue(nQuestIndex, 0, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com