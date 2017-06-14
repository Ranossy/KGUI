------------------------------------------------
-- �ļ���    :  ս������_NPC_�����.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-12-9
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 457 * 0.8, nDamageRand = 457 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 626 * 0.8, nDamageRand = 626 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 1061 * 0.8, nDamageRand = 1061 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1522 * 0.8, nDamageRand = 1522 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 2214 * 0.8, nDamageRand = 2214 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2907 * 0.8, nDamageRand = 2907 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3999 * 0.8, nDamageRand = 3999 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 4768 * 0.8, nDamageRand = 4768 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 5538 * 0.8, nDamageRand = 5538 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 6307 * 0.8, nDamageRand = 6307 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 7076 * 0.8, nDamageRand = 7076 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 7846 * 0.8, nDamageRand = 7846 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 8615 * 0.8, nDamageRand = 8615 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 9384 * 0.8, nDamageRand = 9384 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 10154 * 0.8, nDamageRand = 10154 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 11334 * 0.8, nDamageRand = 11334 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 11591 * 0.8, nDamageRand = 11591 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 11848 * 0.8, nDamageRand = 11848 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 12104 * 0.8, nDamageRand = 12104 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 12361 * 0.8, nDamageRand = 12361 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 12618 * 0.8, nDamageRand = 12618 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 12874 * 0.8, nDamageRand = 12874 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 13131 * 0.8, nDamageRand = 13131 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 13388 * 0.8, nDamageRand = 13388 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 13644 * 0.8, nDamageRand = 13644 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 13901 * 0.8, nDamageRand = 13901 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 14158 * 0.8, nDamageRand = 14158 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 14414 * 0.8, nDamageRand = 14414 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 14671 * 0.8, nDamageRand = 14671 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 14928 * 0.8, nDamageRand = 14928 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 15184 * 0.8, nDamageRand = 15184 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0, 
		0
	);

	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_REPULSED,
		16,  --ʱ��
		0
	);


	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		--skill.BindBuff(1, 1430, 1);		-- ����1��λBuff
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
		--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 416;		-- �������ð뾶6.5��
		skill.nTargetCountLimit	= 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 48;				-- ����֡��
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
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com