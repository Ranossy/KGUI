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
	{nDamageBase = 543 * 0.8, nDamageRand = 543 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 744 * 0.8, nDamageRand = 744 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 1260 * 0.8, nDamageRand = 1260 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1808 * 0.8, nDamageRand = 1808 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 2630 * 0.8, nDamageRand = 2630 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 3452 * 0.8, nDamageRand = 3452 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 4750 * 0.8, nDamageRand = 4750 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 5663 * 0.8, nDamageRand = 5663 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 6577 * 0.8, nDamageRand = 6577 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 7491 * 0.8, nDamageRand = 7491 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 8405 * 0.8, nDamageRand = 8405 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 9319 * 0.8, nDamageRand = 9319 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 10232 * 0.8, nDamageRand = 10232 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 11146 * 0.8, nDamageRand = 11146 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 12060 * 0.8, nDamageRand = 12060 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 13462 * 0.8, nDamageRand = 13462 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 13767 * 0.8, nDamageRand = 13767 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 14072 * 0.8, nDamageRand = 14072 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 14377 * 0.8, nDamageRand = 14377 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 14682 * 0.8, nDamageRand = 14682 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 14986 * 0.8, nDamageRand = 14986 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 15291 * 0.8, nDamageRand = 15291 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 15596 * 0.8, nDamageRand = 15596 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 15901 * 0.8, nDamageRand = 15901 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 16206 * 0.8, nDamageRand = 16206 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 16511 * 0.8, nDamageRand = 16511 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 16816 * 0.8, nDamageRand = 16816 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 17120 * 0.8, nDamageRand = 17120 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 17425 * 0.8, nDamageRand = 17425 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 17730 * 0.8, nDamageRand = 17730 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 18035 * 0.8, nDamageRand = 18035 * 0.4, nCostMana = 0},		--level 31
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
	--skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 5;					-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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