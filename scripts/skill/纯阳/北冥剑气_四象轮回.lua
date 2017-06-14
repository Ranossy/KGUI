---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_�����ֻ�.lua
-- ����ʱ��:	2017/3/7 17:59:11
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ڤ����_�����ֻ�.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  �����ֻ�
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 31, nDamageRand = 3}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 70, nDamageRand = 7}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 11}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 150, nDamageRand = 15}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 189, nDamageRand = 19}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 229, nDamageRand = 23}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 268, nDamageRand = 27}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 308, nDamageRand = 31}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 348, nDamageRand = 35}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 387, nDamageRand = 39}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 427, nDamageRand = 43}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 466, nDamageRand = 47}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 506, nDamageRand = 51}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 546, nDamageRand = 55}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 585, nDamageRand = 59}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 625, nDamageRand = 63}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 664, nDamageRand = 67}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 704, nDamageRand = 71}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 744, nDamageRand = 75}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 783, nDamageRand = 79}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 823, nDamageRand = 82}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 862, nDamageRand = 86}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 902, nDamageRand = 90}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 942, nDamageRand = 94}, -- Level 24
	{nAddRage = 0, nCostRage = 0, nDamageBase = 981, nDamageRand = 98}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1021, nDamageRand = 102}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1060, nDamageRand = 106}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1100, nDamageRand = 110}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1140, nDamageRand = 114}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1179, nDamageRand = 118}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1219, nDamageRand = 122}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1258, nDamageRand = 126}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1298, nDamageRand = 130}, -- Level 33
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ��ɢ��˲��buff
		999,
		1
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ��ɢ��˲��buff
		"skill/����/��ڤ����_�����ֻ�.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		896,
		dwSkillLevel
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(6444, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestOwnBuff(6311, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 850, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);
	--skill.SetCheckCoolDown(2, 625);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 163 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 163 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 163 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 163 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 163;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 2 * GAME_FPS;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
--[[
	if player.GetBuff(8620, 1) then
		player.DelBuff(8620, 1)
	end
--]]
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(66)
	end
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13252)
	local nQuestPhase = player.GetQuestPhase(13252)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
	-- if player.IsAchievementAcquired(61) and player.IsAchievementAcquired(62) and player.IsAchievementAcquired(63) and player.IsAchievementAcquired(64) and player.IsAchievementAcquired(65) and player.IsAchievementAcquired(66) and player.IsAchievementAcquired(67) then
	-- player.AcquireAchievement(72)
	-- end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--[[
	if player.GetBuff(9962, 1) then							--�˺����50%��˲����ƽ����Ѩ��
		player.DelBuff(9962, 1)
	--]]
	if player.GetBuff(10078, 1) then							--ɾ���꼯
		--player.DelBuff(10078, 1)
		--print(11111)
	elseif player.GetBuff(999, 1) then						    --ɾ����Ԫ
		player.DelBuff(999, 1)
	elseif player.GetBuff(11261, 1) then						   
		player.DelBuff(11261, 1)
		--print(22222)
	elseif player.GetBuff(8620, 1) then
		local buff = player.GetBuff(8620, 1)
		if buff.nCustomValue == 0 then
			--print(22222)
			player.AddBuff(player.dwID, player.nLevel, 9962, 1)
			buff.nCustomValue = 1
		else
			local nCount = buff.nLeftActiveCount
			player.DelBuff(8620, 1)
			--print(2222222)
			player.AddBuff(player.dwID, player.nLevel, 10078, 1, nCount)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com