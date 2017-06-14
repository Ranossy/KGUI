------------------------------------------------
-- �ļ���    :  ���ӷ�_С��_���Ӫ���׵���_����.lua
-- ������    :  ������
-- ����ʱ��  :  2009-5-21
-- ��;(ģ��):  ����
-- �书����  :  ���ӷ�_С��_���Ӫ���׵���_����
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :�Ե�ǰĿ�����1574�㣨��ɷ������11%Ѫ���˺����⹦�˺�,CD4�룬�����1������DEBUFF���ܵ����˺����1%���ɵ�������,����10�룩����������DEBUFFת��Ϊ�²�DEBUFF���ܵ����˺����5%��������������������10�룩������ɢ���?                                   
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =                                                                          
{                                                                                     
	{nDamageBase = 95   *0.8, nDamageRand = 95   *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 161  *0.8, nDamageRand = 161  *0.4, nCostMana = 0},		--level 2		  
	{nDamageBase = 231  *0.8, nDamageRand = 231  *0.4, nCostMana = 0},		--level 3		  
	{nDamageBase = 336  *0.8, nDamageRand = 336  *0.4, nCostMana = 0},		--level 4		  
	{nDamageBase = 441  *0.8, nDamageRand = 441  *0.4, nCostMana = 0},		--level 5		  
	{nDamageBase = 606  *0.8, nDamageRand = 606  *0.4, nCostMana = 0},		--level 6		  
	{nDamageBase = 723  *0.8, nDamageRand = 723  *0.4, nCostMana = 0},		--level 7		  
	{nDamageBase = 839  *0.8, nDamageRand = 839  *0.4, nCostMana = 0},		--level 8		  
	{nDamageBase = 956  *0.8, nDamageRand = 956  *0.4, nCostMana = 0},		--level 9		  
	{nDamageBase = 1073 *0.8, nDamageRand = 1073 *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 1189 *0.8, nDamageRand = 1189 *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 1306 *0.8, nDamageRand = 1306 *0.4, nCostMana = 0},		--level 12		
	{nDamageBase = 1422 *0.8, nDamageRand = 1422 *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 1539 *0.8, nDamageRand = 1539 *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 1656 *0.8, nDamageRand = 1656 *0.4, nCostMana = 0},		--level 15	  
	{nDamageBase = 1772 *0.8, nDamageRand = 1772 *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 1889 *0.8, nDamageRand = 1889 *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 2005 *0.8, nDamageRand = 2005 *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 2122 *0.8, nDamageRand = 2122 *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 2239 *0.8, nDamageRand = 2239 *0.4, nCostMana = 0},		--level 20		
};                                                                                    

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
		local dwSkillLevel	= skill.dwLevel
	
	
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
				ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
				1008,
				1
		);
	
		skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
				1021,
				1
		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  	--skill.BindBuff(1, 1155, 1);		-- ����1��λBuff
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
		--skill.nCostLife		= 0;										-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;								-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 4* LENGTH_BASE;			-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 128;									-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
 		--skill.nTargetCountLimit	= 10							-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 90				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0	 					-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;						-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;				-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- Ŀ��Ѫ������ ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;					-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 100 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-				- ��Ŀ�����������,����1024��Ĭ��0
	
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