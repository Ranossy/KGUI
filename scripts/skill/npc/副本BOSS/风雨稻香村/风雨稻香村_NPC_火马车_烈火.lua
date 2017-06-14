------------------------------------------------
-- �ļ���    :  ���굾���_NPC_����_�һ�.lua
-- ������    :  �
-- ����ʱ��  :  2009-8-8
-- ��;(ģ��):  ����
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  �һ�
-- ����Ч��  :  �뾶8�׸��˺������⹦70%���HP��AOE���������DOT�˺���ÿ3��500������15�룬���Լ�Ҳ�����˺�
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =                                                                          
{                                                                                     
	{nDamageBase = 350   *0.8, nDamageRand = 350   *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 592   *0.8, nDamageRand = 592   *0.4, nCostMana = 0},		--level 2		  
	{nDamageBase = 850   *0.8, nDamageRand = 850   *0.4, nCostMana = 0},		--level 3		  
	{nDamageBase = 1236  *0.8, nDamageRand = 1236  *0.4, nCostMana = 0},		--level 4		  
	{nDamageBase = 1623  *0.8, nDamageRand = 1623  *0.4, nCostMana = 0},		--level 5		  
	{nDamageBase = 2233  *0.8, nDamageRand = 2233  *0.4, nCostMana = 0},		--level 6		  
	{nDamageBase = 2663  *0.8, nDamageRand = 2663  *0.4, nCostMana = 0},		--level 7		  
	{nDamageBase = 3092  *0.8, nDamageRand = 3092  *0.4, nCostMana = 0},		--level 8		  
	{nDamageBase = 3522  *0.8, nDamageRand = 3522  *0.4, nCostMana = 0},		--level 9		  
	{nDamageBase = 3951  *0.8, nDamageRand = 3951  *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 4381  *0.8, nDamageRand = 4381  *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 4811  *0.8, nDamageRand = 4811  *0.4, nCostMana = 0},		--level 12		
	{nDamageBase = 5240  *0.8, nDamageRand = 5240  *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 5670  *0.8, nDamageRand = 5670  *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 6099  *0.8, nDamageRand = 6099  *0.4, nCostMana = 0},		--level 15	  
	{nDamageBase = 6529  *0.8, nDamageRand = 6529  *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 6959  *0.8, nDamageRand = 6959  *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 7388  *0.8, nDamageRand = 7388  *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 7818  *0.8, nDamageRand = 7818  *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 8248  *0.8, nDamageRand = 8248  *0.4, nCostMana = 0},		--level 20		
};                                                                                    

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
		local dwSkillLevel	= skill.dwLevel
	
	
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
  	--skill.AddSlowCheckSelfBuff(1159, 1,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
   
	----------------- BUFF��� -------------------------------------------------
  	skill.BindBuff(1, 1361, 1);								-- ����1��λBuff
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
		--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 7* LENGTH_BASE;			-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;								-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
 		skill.nTargetCountLimit	= 10;							-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
   	skill.nBeatBackRate      = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate					= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
		--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
		--skill.nWeaponDamagePercent		= 0;		-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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