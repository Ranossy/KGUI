---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ѩƮҡ.lua
-- ����ʱ��:	2013/9/3 17:47:57
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ����	
-- ����ʱ��  :  2009-03-13
-- ����Ч��  :  ����ͨ��3�룬ÿ���Ѫ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nTherapy = 157 / 3 * 0.95, nTherapyRand = 157 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 189 / 3 * 0.95, nTherapyRand = 189 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 221 / 3 * 0.95, nTherapyRand = 221 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 253 / 3 * 0.95, nTherapyRand = 253 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 285 / 3 * 0.95, nTherapyRand = 285 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 317 / 3 * 0.95, nTherapyRand = 317 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 349 / 3 * 0.95, nTherapyRand = 349 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 381 / 3 * 0.95, nTherapyRand = 381 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 413 / 3 * 0.95, nTherapyRand = 413 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 445 / 3 * 0.95, nTherapyRand = 445 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 477 / 3 * 0.95, nTherapyRand = 477 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 509 / 3 * 0.95, nTherapyRand = 509 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 541 / 3 * 0.95, nTherapyRand = 541 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 573 / 3 * 0.95, nTherapyRand = 573 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 605 / 3 * 0.95, nTherapyRand = 605 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 637 / 3 * 0.95, nTherapyRand = 637 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 669 / 3 * 0.95, nTherapyRand = 669 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 701 / 3 * 0.95, nTherapyRand = 701 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 733 / 3 * 0.95, nTherapyRand = 733 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 765 / 3 * 0.95, nTherapyRand = 765 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 797 / 3 * 0.95, nTherapyRand = 797 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 829 / 3 * 0.95, nTherapyRand = 829 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 861 / 3 * 0.95, nTherapyRand = 861 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 893 / 3 * 0.95, nTherapyRand = 893 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 925 / 3 * 0.95, nTherapyRand = 925 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 957 / 3 * 0.95, nTherapyRand = 957 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 989 / 3 * 0.95, nTherapyRand = 989 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 1021 / 3 * 0.95, nTherapyRand = 1021 / 3 * 0.1, nCostMana = 211},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6250,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6654,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6655,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6656,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6657,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��������_��ѩƮҡ.lua", --����ֵ1
		0															--����ֵ2
	);
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ���Ƹ���ֵ
	--tSkillData[dwSkillLevel].nTherapyRand,
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_THERAPY, -- Call����
	--0,
	--0
	--);
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetCheckCoolDown(1, 444);
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 320*0.8 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 320*0.8 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 320 *0.8* 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 320*0.8 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 320*0.8;	-- �������ĵ�����
	end
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- ����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- ����ʩ�����뾶
	skill.nAngleRange = 256; 									-- ʩ�ŽǶ�
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nChannelInterval = GAME_FPS; 			-- ͨ�������ʱ��
	skill.nMinChannelInterval = 1;-- ͨ�������ʱ�� 
	skill.nChannelFrame = 3 * GAME_FPS;			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nBulletVelocity = 0;					-- �ӵ��ٶȣ���λ ��/֡
	skill.nMinChannelFrame = 1
	skill.nBreakRate = 1024;					--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(54)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local i = Random(1, 100)
	if player.IsSkillRecipeActive(1629, 1) then
		if i <= 10 then
			player.CastSkill(8020, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com