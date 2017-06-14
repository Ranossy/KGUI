---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_�����ľ�_ʥ��֯��.lua
-- ����ʱ��:	2013/8/27 14:39:24
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2011-1-6
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73 * 0.95, nDamageRand = 73 * 0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86 * 0.95, nDamageRand = 86 * 0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 99 * 0.95, nDamageRand = 99 * 0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112 * 0.95, nDamageRand = 112 * 0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125 * 0.95, nDamageRand = 125 * 0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 138 * 0.95, nDamageRand = 138 * 0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151 * 0.95, nDamageRand = 151 * 0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 164 * 0.95, nDamageRand = 164 * 0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 177 * 0.95, nDamageRand = 177 * 0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190 * 0.95, nDamageRand = 190 * 0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 203 * 0.95, nDamageRand = 203 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216 * 0.95, nDamageRand = 216 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 229 * 0.95, nDamageRand = 229 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255 * 0.95, nDamageRand = 255 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 268 * 0.95, nDamageRand = 268 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 281 * 0.95, nDamageRand = 281 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 294 * 0.95, nDamageRand = 294 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 307 * 0.95, nDamageRand = 307 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 320 * 0.95, nDamageRand = 320 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 333 * 0.95, nDamageRand = 333 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 346 * 0.95, nDamageRand = 346 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 359 * 0.95, nDamageRand = 359 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 372 * 0.95, nDamageRand = 372 * 0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 385 * 0.95, nDamageRand = 385 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 398 * 0.95, nDamageRand = 398 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 411 * 0.95, nDamageRand = 411 * 0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 424 * 0.95, nDamageRand = 424 * 0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 437 * 0.95, nDamageRand = 437 * 0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450 * 0.95, nDamageRand = 450 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 463 * 0.95, nDamageRand = 463 * 0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 476 * 0.95, nDamageRand = 476 * 0.1, }, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 489 * 0.95, nDamageRand = 489 * 0.1, }, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 502 * 0.95, nDamageRand = 502 * 0.1, }, -- Level 34
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�嶾/�嶾_�����ľ�_ʥ��֯��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2953, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 454);	
	skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostManaBasePercent 	= 0.28;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 902*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 902 * 0.4;
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 902 * 0.6;
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 902 * 0.8;
	else
		skill.nCostManaBasePercent = 902;
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64;
	elseif dwSkillLevel < 34 then
		skill.nChannelInterval = 64 + (dwSkillLevel - 9) * 4
	else
		skill.nChannelInterval = 170;     -- ͨ�������ʱ��   
	end
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
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
    
	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--���ｵ�͵�Ϣʱ���ı似���߼�Ŀ�꣬����ʹ��һ��Ҫע��
	--������Ѫֵ����35%��Ŀ�꣬��Ϣʱ�併��5��
	if player.GetSkillLevel(14866) == 1 then
		if target.nCurrentLife <= target.nMaxLife * 0.5 then
			player.CastSkill(14895, 1)
			ModityCDToUI(player, 2957, 0, 0)
		end
	end

	local nlev = player.GetSkillLevel(2957)
	if player.GetSkillLevel(6668) == 1 and target.nCurrentLife <= target.nMaxLife * 0.7 then
		--Ŀ��50%Ѫ�����¶���30%����
		if IsPlayer(dwCharacterID) then
			player.CastSkill(13426, nlev, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(13426, nlev, TARGET.NPC, dwCharacterID)
		end
	else
		--����Ч��
		if IsPlayer(dwCharacterID) then
			player.CastSkill(13425, nlev, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(13425, nlev, TARGET.NPC, dwCharacterID)
		end
	end
	
	local m = 0
	local n = 0

	--��Ѩ��1��
	if player.GetSkillLevel(6666) == 1 then
		m = m + 1
	end

	--�ؼ���1��
	if player.IsSkillRecipeActive(1696, 1) then
		m = m + 1
	end
	--��װ����1��
	if player.IsSkillRecipeExist(1184, 1) then
		m = m + 1
	end
	
	if player.GetSkillLevel(6666) == 1 then
		n = n + 1
	end
	
	if not target.GetBuff(7734,1) then
		if m == 0 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 2953, 1 + n)
		elseif m == 3 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 8839, 1 + n)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 6635 + m, 1 + n)
		end
	end
	
	if player.GetSkillLevel(6042) == 1 then
		player.CastSkillXYZ(6198, 1, target.nX, target.nY, target.nZ)
		player.PlaySfx(483, target.nX, target.nY, target.nZ + 500)
	end
	--ʥ�ּ���غʹ��
	if player.GetSkillLevel(6043) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5777, 1, 1)
	end

	ModityCDToUI(player, 2957, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com