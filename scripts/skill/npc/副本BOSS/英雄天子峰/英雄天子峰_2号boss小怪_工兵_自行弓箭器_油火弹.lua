------------------------------------------------
-- �ļ���    :  Ӣ�����ӷ�_1��boss_1��boss_�����ֻ�.lua
-- ������    :  �ⵣ
-- ����ʱ��  :  2009-10-22
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ������Ԫ�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 54 * 0.8, nDamageRand = 54 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 74 * 0.8, nDamageRand = 74 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 126 * 0.8, nDamageRand = 126 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 181 * 0.8, nDamageRand = 181 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 263 * 0.8, nDamageRand = 263 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 345 * 0.8, nDamageRand = 345 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 475 * 0.8, nDamageRand = 475 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 566 * 0.8, nDamageRand = 566 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 658 * 0.8, nDamageRand = 658 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 749 * 0.8, nDamageRand = 749 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 840 * 0.8, nDamageRand = 840 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 932 * 0.8, nDamageRand = 932 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 1023 * 0.8, nDamageRand = 1023 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 1115 * 0.8, nDamageRand = 1115 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 1206 * 0.8, nDamageRand = 1206 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 1346 * 0.8, nDamageRand = 1346 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1377 * 0.8, nDamageRand = 1377 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1407 * 0.8, nDamageRand = 1407 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1438 * 0.8, nDamageRand = 1438 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1468 * 0.8, nDamageRand = 1468 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1499 * 0.8, nDamageRand = 1499 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1529 * 0.8, nDamageRand = 1529 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1560 * 0.8, nDamageRand = 1560 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1590 * 0.8, nDamageRand = 1590 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 1621 * 0.8, nDamageRand = 1621 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 1651 * 0.8, nDamageRand = 1651 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 1682 * 0.8, nDamageRand = 1682 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 1712 * 0.8, nDamageRand = 1712 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 1743 * 0.8, nDamageRand = 1743 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 1773 * 0.8, nDamageRand = 1773 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 1803 * 0.8, nDamageRand = 1803 * 0.4, nCostMana = 0},		--level 31
};

-- �����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase * 0.14, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
			0, 
			0
			);
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    --����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;										-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana		-- �������ĵ�����
    --skill.nCostStamina	= 0;										-- �������ĵ�����
    --skill.nCostItemType	= 0;										-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;										-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 300 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 3 * GAME_FPS;				-- ����֡��
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
    --skill.nBeatBackRate       = 0;		-- ���ܱ����˵ĸ���,Ĭ��1024
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
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com