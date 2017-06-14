---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ٻ���Ѩ��_����ع��.lua
-- ����ʱ��:	2013/6/2 23:05:52
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_�ٻ���Ѩ��_����ع��.lua
-- ������    :  ����ǿ	
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  1.5������
-- �书��·  :  ��Ѩ����
-- ��������  :  ����ָ
-- ����Ч��  :  Զ�����Գ������ˣ�����18��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
-- 	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		286,
--		dwSkillLevel
--		);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		285,
		dwSkillLevel
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		2726, -- ����ֵ1
		1																	-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ٻ���Ѩ��_����ع��.lua",
		0
	);	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 674, dwSkillLevel);			-- ����Buff
	--skill.BindBuff(1, tSkillData[dwSkillLevel].nDotID, tSkillData[dwSkillLevel].nDotLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(1, 175);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 279 * 0.2*0.85;	-- �������ĵ�����
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 279*0.4*0.85;	-- �������ĵ�����
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 279*0.6*0.85;	-- �������ĵ�����
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 279*0.8*0.85;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 279*0.85;	-- �������ĵ�����
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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;				-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 32;				-- ����֡��
	--skill.nChannelInterval	= 16; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 85;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(43)
	end
	-- if player.IsAchievementAcquired(43) and player.IsAchievementAcquired(44) and player.IsAchievementAcquired(45) and player.IsAchievementAcquired(46) and player.IsAchievementAcquired(47) and player.IsAchievementAcquired(48) then
		-- player.AcquireAchievement(69)
	-- end
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

	--ͨ��ɾ��˲��buff
	if player.GetBuff(412, 1) then
		--ɾˮ��
		player.DelBuff(412, 1)
	elseif player.GetBuff(932, 1) then
		--ɾ��Ѹӿ
		player.DelBuff(932, 1)
	end
	
	target.AddBuff(player.dwID, player.nLevel, 5695, 1, 1)
	if player.GetSkillLevel(5766) == 1 then
		if player.GetBuff(2719, 1) then
			player.CastSkillXYZ(6138, 1, target.nX, target.nY, target.nZ)
		end
	end
	--[[
	if player.GetSkillLevel(5771) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 6258, 1, 1)
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com