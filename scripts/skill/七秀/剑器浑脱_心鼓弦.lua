---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_�Ĺ���.lua
-- ����ʱ��:	2017/1/16 14:54:43
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ���
-- ����ʱ��  :  2008-8-25
-- ����Ч��  :  �������ս����ʹ�ã�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill����/����ʹ�ø���ܻ�ж�.lua")

tSkillData =
{
	{nReviveLife = 769, nReviveMana = 923, nCostMana = 92},
	{nReviveLife = 1111, nReviveMana = 1334, nCostMana = 133},
	{nReviveLife = 1368, nReviveMana = 1641, nCostMana = 164},
	{nReviveLife = 1624, nReviveMana = 1949, nCostMana = 194}
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 4

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --���������Ϊ50tSkillData[dwSkillLevel].nReviveLife
		tSkillData[dwSkillLevel].nReviveMana		--���������Ϊ50tSkillData[dwSkillLevel].nReviveMana
	);

	--ɾ��������˱��buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		901,
		1
	);
	--[[  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
        901,											--���������Ϊ50tSkillData[dwSkillLevel].nReviveLife
        1											--���������Ϊ50tSkillData[dwSkillLevel].nReviveMana
    );--]]

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD1.5��
	skill.SetNormalCoolDown(1, 113);	--����CD
	skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 590;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 2.5 * GAME_FPS;						--����֡��,16֡����1��
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	-- if skill.dwLevel == 1 then
	-- player.AcquireAchievement(52)
	-- end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com