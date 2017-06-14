---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_����.lua
-- ����ʱ��:	2013/5/7 14:26:00
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2010-11-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 16*0.95, 	nDamageRand = 16*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22*0.95, 	nDamageRand = 22*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29*0.95, 	nDamageRand = 29*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35*0.95, 	nDamageRand = 35*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42*0.95, 	nDamageRand = 42*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48*0.95, 	nDamageRand = 48*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55*0.95, 	nDamageRand = 55*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61*0.95, 	nDamageRand = 61*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68*0.95, 	nDamageRand = 68*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 74*0.95, 	nDamageRand = 74*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81*0.95, 	nDamageRand = 81*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 87*0.95, 	nDamageRand = 87*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94*0.95, 	nDamageRand = 94*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100*0.95, 	nDamageRand = 100*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 107*0.95, 	nDamageRand = 107*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 113*0.95, 	nDamageRand = 113*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120*0.95, 	nDamageRand = 120*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 126*0.95, 	nDamageRand = 126*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133*0.95, 	nDamageRand = 133*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139*0.95, 	nDamageRand = 139*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 146*0.95, 	nDamageRand = 146*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 152*0.95, 	nDamageRand = 152*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 159*0.95, 	nDamageRand = 159*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 165*0.95, 	nDamageRand = 165*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 172*0.95, 	nDamageRand = 172*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 178*0.95, 	nDamageRand = 178*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 185*0.95, 	nDamageRand = 185*0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 191*0.95, 	nDamageRand = 191*0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 198*0.95, 	nDamageRand = 198*0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 204*0.95, 	nDamageRand = 204*0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 211*0.95, 	nDamageRand = 211*0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 217*0.95, 	nDamageRand = 217*0.1, }, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 224*0.95, 	nDamageRand = 224*0.1, }, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 230*0.95, 	nDamageRand = 230*0.1, }, -- Level 34
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�嶾/�嶾_����ͼ¼_����.lua", -- ����ֵ1
		0														-- ����ֵ2
		);

	--dot�˺�
	skill.AddAttribute(													
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		6238, --����ֵ1
		dwSkillLevel										--����ֵ2
	);
   		
	--˲���˺�
	skill.AddAttribute(													
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		13472, --����ֵ1
		dwSkillLevel										--����ֵ2
		);
	--[[
	skill.AddAttribute(													-- �����ƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2458, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- ���Ĺƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2463, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- �ݲйƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2468, --����ֵ1
		dwSkillLevel										--����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_GROUP_BUFF_BY_ID_AND_LEVEL,
		6226,
		1
	);
	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2509, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 400);
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
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 516*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 516 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 516 * 0.6;
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 516 * 0.8;
	else
		skill.nCostManaBasePercent = 516;
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
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nChannelInterval = 216; 				-- ͨ�������ʱ�� 
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
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1745)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print(11111)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--print(222222)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	--print(333333)
	if not target then
		return
	end
	--[[
	if player.GetBuff(10180, 1)then
		player.DelBuff(10180, 1)
	end
	--]]
	--print(44444)
	if player.GetSkillLevel(6016) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5764, 1, 1)
	end

	local nlev = player.GetSkillLevel(2212)
	
	if nlev ~= 0 then
		--print(55555)
		--��������
		if target.GetBuff(2307, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2458, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2458, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2458, nlev, player.GetSkillTarget())
		end
		--��������
		if target.GetBuff(2308, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2463, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2463, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2463, nlev, player.GetSkillTarget())
		end
		--�����ݲ�
		if target.GetBuff(2309, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2468, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2468, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2468, nlev, player.GetSkillTarget())
		end
	end

	ModityCDToUI(player, 2212, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com