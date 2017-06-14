---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������_�����޽�.lua
-- ����ʱ��:	2014/7/3 19:31:48
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_�����޽�.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2008-07-01
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  �����޽�
-- ����Ч��  :  �������� ��ɵ����˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, nDamageRand = 7}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 154, nDamageRand = 15}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 228, nDamageRand = 24}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 302, nDamageRand = 32}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 376, nDamageRand = 40}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, nDamageRand = 48}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 524, nDamageRand = 56}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 598, nDamageRand = 65}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 672, nDamageRand = 73}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 746, nDamageRand = 81}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 820, nDamageRand = 89}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 894, nDamageRand = 97}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 968, nDamageRand = 106}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1042, nDamageRand = 114}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1116, nDamageRand = 122}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1190, nDamageRand = 130}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1264, nDamageRand = 138}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1338, nDamageRand = 147}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1412, nDamageRand = 155}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1486, nDamageRand = 163}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1560, nDamageRand = 171}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1634, nDamageRand = 179}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1708, nDamageRand = 188}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1782, nDamageRand = 196}, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1856, nDamageRand = 204}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1930, nDamageRand = 212}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2004, nDamageRand = 220}, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2078, nDamageRand = 229}, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2152, nDamageRand = 237}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2226, nDamageRand = 245}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2300, nDamageRand = 253}, -- Level 31
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2374, nDamageRand = 261}, -- Level 32
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2448, nDamageRand = 270}, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2522, nDamageRand = 278}, -- Level 34
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2596, nDamageRand = 286}, -- Level 35
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/����/�������_�����޽�.lua",							--����ֵ1
   		0							--����ֵ2
   		);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;			-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 315*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 315*0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 315*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 315*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 315;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	skill.bIsAccumulate = true;						-- �����Ƿ���Ҫ����
	skill.SetSubsectionSkill(1, 1, 383, dwSkillLevel)	-- 1����
	skill.SetSubsectionSkill(2, 2, 386, dwSkillLevel)
	skill.SetSubsectionSkill(3, 3, 387, dwSkillLevel)
	skill.SetSubsectionSkill(4, 4, 388, dwSkillLevel)
	skill.SetSubsectionSkill(5, 5, 389, dwSkillLevel)	-- 5����
	skill.SetSubsectionSkill(6, 6, 390, dwSkillLevel)
	skill.SetSubsectionSkill(7, 7, 391, dwSkillLevel)
	skill.SetSubsectionSkill(8, 8, 392, dwSkillLevel)
	skill.SetSubsectionSkill(9, 9, 393, dwSkillLevel)
	skill.SetSubsectionSkill(10, 10, 394, dwSkillLevel)	-- 10����

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(62)
	end
	--��������ָ������
	--local nQuestIndex = player.GetQuestIndex(13420)
	--local nQuestPhase = player.GetQuestPhase(13420)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
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
	--��ħЧ������S_9356�ĸ�ħ�������˽���B_8007״̬����Ч
	if player.GetSkillLevel(9356) == 1 and player.GetBuff(8007, 1) then
		player.ClearCDTime(438)
	end

	if player.GetSkillLevel(15187) == 1 then
		local nbuff = player.GetBuff(10203, 1)
		if nbuff then
			--print(2222)
			player.ResetCD(983)
			local nCount = nbuff.nStackNum
			--print(nCount)
			for i = 1, 5-nCount do
				--print(1111111)
				player.CastSkill(15192, 1)
			end
		end
		
		for i = 1, 5 do
			player.DelBuff(10204, i)
		end

		player.DelGroupBuff(10203, 1)
		RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 15187, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com