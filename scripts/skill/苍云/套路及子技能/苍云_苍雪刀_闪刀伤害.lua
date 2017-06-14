---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��ѩ��_�����˺�.lua
-- ����ʱ��:	2014/11/8 11:30:53
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 30, nDamageRand = 20 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 45, nDamageRand = 45 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 60, nDamageRand = 60 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 75, nDamageRand = 75 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 90, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 105, nDamageRand = 105 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 120, nDamageRand = 120 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 135, nDamageRand = 135 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 150, nDamageRand = 150 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 165, nDamageRand = 165 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 180, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 195, nDamageRand = 195 * 0.1, nCostMana = 0}, --level 12
	{nDamageBase = 210, nDamageRand = 210 * 0.1, nCostMana = 0}, --level 13
	{nDamageBase = 225, nDamageRand = 225 * 0.1, nCostMana = 0}, --level 14
	{nDamageBase = 240, nDamageRand = 240 * 0.1, nCostMana = 0}, --level 15
	{nDamageBase = 255, nDamageRand = 255 * 0.1, nCostMana = 0}, --level 16
	{nDamageBase = 270, nDamageRand = 270 * 0.1, nCostMana = 0}, --level 17
	{nDamageBase = 300, nDamageRand = 300 * 0.1, nCostMana = 0}, --level 18
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��·���Ӽ���/����_��ѩ��_�����˺�.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff   --��ǽ״̬�±��buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 806);	--������ͨCD
	--skill.SetNormalCoolDown(2, 804);	--������ͨCD
	--skill.SetNormalCoolDown(3, 836);	--����0.5��
	--skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�
	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
--	skill.nCostRage = 10

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 15 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 1;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 45*0.9;
	elseif dwSkillLevel < 18 then
		skill.nChannelInterval = (45 + (dwSkillLevel - 4) * 8)*0.9;
	else
		skill.nChannelInterval = 160*0.9;     -- ͨ�������ʱ��
	end
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
	skill.nNeedPoseState = 1
	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 1024;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	player.DelGroupBuff(8373, 1)  --ɾ�������˺��������

--	local lvXD = player.GetSkillLevel(13153)  --Ѫ��
	local lvGL = player.GetSkillLevel(13132)  --����
	local lvNT = player.GetSkillLevel(13133)  --ŭ��
	local lvZD = player.GetSkillLevel(13054)  --ն���ȼ�

	local nTarget
	if IsPlayer(dwCharacterID) then
		nTarget = GetPlayer(dwCharacterID)
	else
		nTarget = GetNpc(dwCharacterID)
	end
	player.TurnToCharacter(nTarget.dwID)
	local lv = player.GetSkillLevel(13053)
	--[[
	if player.GetSkillLevel(13321) == 1 then --����
		nTarget.AddBuff(player.dwID, player.nLevel, 8398, 1, 12) -- Ŀ�����60%
	end
	--]]
	if nTarget then
		if nTarget.GetBuffByOwner(8249, lvZD, player.dwID) then   --��Ѫ
			if lvGL >= 1 then-------------------------------------------------------
				player.AddBuff(0, 99, 8389, 1, 1) --������Ѫ����
				local TSbuff = player.GetBuff(8389, 1)
				local nCount = nTarget.GetBuffByOwner(8249, lvZD, player.dwID).nLeftActiveCount     --������Ѫ��ʣ������
				if TSbuff then
					TSbuff.nCustomValue = nCount
				end
				local nSNum = nTarget.GetBuffByOwner(8249, lvZD, player.dwID).nStackNum    --������Ѫ�Ķѵ�����
				local LXbuff = nTarget.GetBuffByOwner(8249, lvZD, player.dwID)  --ɾ���Լ��������ڷ�ǿ�������Ѫ
				if nSNum == 2 then
					nTarget.DelBuffByIndex(LXbuff.nIndex)
					nTarget.DelBuffByIndex(LXbuff.nIndex)
				else
					nTarget.DelBuffByIndex(LXbuff.nIndex)
				end
				for i = 1, nSNum do --����ʣ����������ͷŶ��ٴμ�ǿ����
					player.CastSkill(13308, lvZD) --�и���ǿ����Ѫ������£��ͷ�Ч�����50%���Ӽ���
				end
			end--------------------------------------------------------------------
		end

	--[[	if lvXD >= 1 then
			player.AddBuff(player.dwID, player.nLevel, 8274, 1, 4)  --��������ΪѪ����buffά��4��
		end]]--
		if  nTarget.GetBuffByOwner(8248, 1, player.dwID) then --����
			if lvNT >= 1 then
				player.AddBuff(player.dwID, player.nLevel, 8276, 1, 8) --10������˺����20%
			end
		end
	--[[	local lvYD = player.GetSkillLevel(13152)  --����
		if  nTarget.GetBuffByOwner(8248, 1, player.dwID) then --����
			if lvYD >= 1 then
				if not player.GetBuff(8270, 1) then
					player.AddBuff(player.dwID, player.nLevel, 8270, 1, 5)  --��������Ϊ������buffά��7��
				end
			end
		end]]--
	end

-----------------------------------------------------Ѫŭ��Ѫ
	local lvxn = player.GetSkillLevel(13040)
	local nRageCost = 10
	local nReplishLife = 0.001

	if player.GetSkillLevel(13073) == 1 and lvxn ~= 0 and (player.GetBuff(8244, lvxn) or player.GetBuff(8245, lvxn))then
		if player.nCurrentLife <= player.nMaxLife * nRageCost * (1-nReplishLife) then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * nRageCost * nReplishLife
		else
			player.nCurrentLife = player.nMaxLife
		end
	end
---------------------------------------------------
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com