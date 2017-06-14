------------------------------------------------
-- �ļ���    :  ���_Ұ��BOSS_���Ƴ�_���·ת.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-12-25
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  Merry Christmas
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 303 * 0.8, nDamageRand = 303 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 415 * 0.8, nDamageRand = 415 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 703 * 0.8, nDamageRand = 703 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1009 * 0.8, nDamageRand = 1009 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1468 * 0.8, nDamageRand = 1468 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1927 * 0.8, nDamageRand = 1927 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2651 * 0.8, nDamageRand = 2651 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3161 * 0.8, nDamageRand = 3161 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3671 * 0.8, nDamageRand = 3671 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 4182 * 0.8, nDamageRand = 4182 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4692 * 0.8, nDamageRand = 4692 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5202 * 0.8, nDamageRand = 5202 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5712 * 0.8, nDamageRand = 5712 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 6222 * 0.8, nDamageRand = 6222 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 6732 * 0.8, nDamageRand = 6732 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 7515 * 0.8, nDamageRand = 7515 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 7685 * 0.8, nDamageRand = 7685 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 7855 * 0.8, nDamageRand = 7855 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 8025 * 0.8, nDamageRand = 8025 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 19600 * 0.8, nDamageRand = 19600 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 8366 * 0.8, nDamageRand = 8366 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 8536 * 0.8, nDamageRand = 8536 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 8706 * 0.8, nDamageRand = 8706 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 8876 * 0.8, nDamageRand = 8876 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 9046 * 0.8, nDamageRand = 9046 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 9216 * 0.8, nDamageRand = 9216 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 9387 * 0.8, nDamageRand = 9387 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 9557 * 0.8, nDamageRand = 9557 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 9727 * 0.8, nDamageRand = 9727 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 9897 * 0.8, nDamageRand = 9897 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 10067 * 0.8, nDamageRand = 10067 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

   		skill.AddAttribute(
   			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   			"skill/Quest/���_Ұ��BOSS_���Ƴ�_���·ת.lua",			-- ����ֵ1
   			0															-- ����ֵ2
   			);   	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase * 0.14, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
			0, 
			0
			);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DASH_FORWARD, 
		8, 
		125
	);      

 	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		7285,
		dwSkillLevel
	);

	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
	40,
	0
	);
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		skill.BindBuff(1, 994, 3);		-- ����1��λBuff
		--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
		--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
		--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

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
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		--skill.nMinRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 32 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 12 * LENGTH_BASE;		-- �������ð뾶 
		--skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		  = 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
	end
	
	if not character then
	    return
    end
    local scene = character.GetScene()
	if not scene then
	    return
    end

    local npcBoss = scene.GetNpcByNickName("muyunchong")
    if npcBoss then
        npcBoss.FireAIEvent(2001, 0, 0)
    end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com