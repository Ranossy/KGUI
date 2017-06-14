---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������_�˽���һ_����.lua
-- ����ʱ��:	2017/4/18 17:55:57
-- �����û�:	xueyan3
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_�˽���һ.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2008-09-11
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/�˽���һ_�����佣��.lua")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 538, nDamageRand = 0}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 573, nDamageRand = 0}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 608, nDamageRand = 0}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 643, nDamageRand = 0}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 678, nDamageRand = 0}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 713, nDamageRand = 0}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 748, nDamageRand = 0}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 783, nDamageRand = 0}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 818, nDamageRand = 0}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 853, nDamageRand = 0}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 888, nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 923, nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 958, nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 993, nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1028, nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1063, nDamageRand = 0}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1098, nDamageRand = 0}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1133, nDamageRand = 0}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1168, nDamageRand = 0}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1203, nDamageRand = 0}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1238, nDamageRand = 0}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1273, nDamageRand = 0}, -- Level 22
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		3783, -- ��buff�˺�
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		3784, -- ��buff�˺�
		dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�������_�˽���һ_����.lua", -- ��Э��
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	skill.AddCheckSelfLearntSkill(17586, 1, SKILL_COMPARE_FLAG.EQUAL);

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);				-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);				-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 1198);						-- 196��CD10��
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 4 then
		skill.nCostManaBasePercent = 204 * 0.1;	-- �������ĵ�����
	elseif dwSkillLevel <= 8 then
		skill.nCostManaBasePercent = 204 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 204 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 204 * 0.7;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 204;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 5 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 10 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.TargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.SelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.SelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(63)
	end
	if player.GetSkillLevel(588) < skill.dwLevel then
		player.LearnSkillLevel(588, skill.dwLevel, player.dwID)
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

	local lv = player.GetSkillLevel(588)	--�˽�

	--ֱ��ȡ��������
	local npc
	for i = 1, 3 do
		npc = player.GetGas(i - 1)
		if npc then
			if GetCharacterDistance(npc.dwID, player.dwID) < 20 * 64 then
				QiChangGrowUP(npc)
			end
		end
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local Npcjzfz
	Npcjzfz = scene.CreateNpc(56678, player.nX, player.nY, player.nZ, 0, 48, "jianzhen_xuanmen" .. player.dwID)
	if not Npcjzfz then
		return
	end
--	print(1111)
	--���껥������
	if player.IsInParty() then
		player.CastSkill(17582, 1)
	else
		--���������£�ֱ���Լ���������
		local npc
		for i = 1, 3 do
			npc = player.GetGas(i - 1)
			if npc then
				if GetCharacterDistance(npc.dwID, player.dwID) < 20 * 64 then
					Npcjzfz.SetCustomUnsigned4(4 * i - 3, npc.dwID)
					Npcjzfz.SetCustomUnsigned1(0, Npcjzfz.GetCustomUnsigned1(0) + 1)
				end
			end
		end
	end
	player.SetTimer(2, "scripts/skill/����/�������_�˽���һ_����.lua", Npcjzfz.dwID, 0)

	--�����Լ�����
--	player.CastSkill(3784, lv)
	--print(222)
	--��ħЧ��,S_9356�����Ұ˻�ѭ��
	if player.GetSkillLevel(9356) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 8007, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local npcjzfz = GetNpc(nParam1)
	if not npcjzfz then
		return
	end
	if not player then
		return
	end
	local jznum = npcjzfz.GetCustomUnsigned1(0)
--	print(jznum)
	if jznum <= 2 then
		return
	end
	if jznum > 7 then
		jznum = 7
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local Npcjz = scene.CreateNpcWithEmployerID(56678, player.nX, player.nY, player.nZ, 0, 60 * 16, player.dwID)
	Npcjz.SetCustomUnsigned1(0, jznum)
	local npctable = {}
	local npc
	for i = 1, jznum do
		local npcid = npcjzfz.GetCustomUnsigned4(4 * i - 3)
		npc = GetNpc(npcid)
		if npc then
			table.insert(npctable, npcid)
		end
	end
	npcjzfz.SetDisappearFrames(1, false)
	local nConvexIndex = scene.CalcConvexHull(jznum, npctable, {player.nX, player.nY, player.nZ})
	local tbl = scene.GetConvexHull(nConvexIndex)
	player.AddBuff(player.dwID, player.nLevel, 11921, 1, 60)
	local buff = player.GetBuff(11921, 1)
	if buff then
		buff.nCustomValue = nConvexIndex
	end
	Npcjz.dwConvexHullID = nConvexIndex
	if not tbl then
		return
	end
	local num = #tbl
	local nX, nY, nZ = 0, 0, 0
	if num > 0 then
		Npcjz.SetCustomUnsigned4(0, num)

		for i = 1, num do
			npc = GetNpc(tbl[i])
			if npc then
				Npcjz.SetCustomUnsigned4(4 * i - 3, npc.dwID)
				local npcoldjz = GetNpc(npc.GetCustomUnsigned4(1))
				if npcoldjz then
					local jzidold = npcoldjz.dwConvexHullID
					npcoldjz.SetDisappearFrames(1)
					scene.RemoveConvexHull(jzidold)
				end
				npc.SetCustomUnsigned4(1, Npcjz.dwID)
				nX = nX + npc.nX
				nY = nY + npc.nY
				nZ = nZ + npc.nZ
			end
		end
		nX = nX / num
		nY = nY / num
		nZ = nZ / num
	end
	Npcjz.SetPosition(nX, nY, nZ)
	Npcjz.FireAIEvent(2001,1,1)
--	Npcjz.AddBuff(Npcjz.dwID, player.nLevel, 11883, 1, 60)
--	Npcjz.CastSkill(17583,1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com