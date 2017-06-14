------------------------------------------------
-- �ļ���    :  ���굾���_NPC_Ī��_��Ȫ����.lua
-- ������    :  �
-- ����ʱ��  :  2009-8-8
-- ��;(ģ��):  ����
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  ��Ȫ����
-- ����Ч��  :  ǰ��90�ȷ�Χ��8��Զ�������ڹ�Ч�����Է�Χ��Ŀ�����1234���ڹ��˺���Ŀ�����һ���⹥������1234�㣬����10�롣
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =                                                                          
{                                                                                     
	{nDamageBase = 98     *0.8, nDamageRand = 98     *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 167    *0.8, nDamageRand = 167    *0.4, nCostMana = 0},		--level 2		  
	{nDamageBase = 239    *0.8, nDamageRand = 239    *0.4, nCostMana = 0},		--level 3		  
	{nDamageBase = 348    *0.8, nDamageRand = 348    *0.4, nCostMana = 0},		--level 4		  
	{nDamageBase = 457    *0.8, nDamageRand = 457    *0.4, nCostMana = 0},		--level 5		  
	{nDamageBase = 629    *0.8, nDamageRand = 629    *0.4, nCostMana = 0},		--level 6		  
	{nDamageBase = 750    *0.8, nDamageRand = 750    *0.4, nCostMana = 0},		--level 7		  
	{nDamageBase = 871    *0.8, nDamageRand = 871    *0.4, nCostMana = 0},		--level 8		  
	{nDamageBase = 992    *0.8, nDamageRand = 992    *0.4, nCostMana = 0},		--level 9		  
	{nDamageBase = 1113   *0.8, nDamageRand = 1113   *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 1234   *0.8, nDamageRand = 1234   *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 1355   *0.8, nDamageRand = 1355   *0.4, nCostMana = 0},		--level 12		
	{nDamageBase = 1476   *0.8, nDamageRand = 1476   *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 1596   *0.8, nDamageRand = 1596   *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 1717   *0.8, nDamageRand = 1717   *0.4, nCostMana = 0},		--level 15	  
	{nDamageBase = 1838   *0.8, nDamageRand = 1838   *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 1959   *0.8, nDamageRand = 1959   *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 2080   *0.8, nDamageRand = 2080   *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 2201   *0.8, nDamageRand = 2201   *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 2322   *0.8, nDamageRand = 2322   *0.4, nCostMana = 0},		--level 20		
};                                                                                    

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
		local dwSkillLevel	= skill.dwLevel
	
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,				
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE, 		
        0, 
        0
    );

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
  	--skill.AddSlowCheckSelfBuff(1159, 1,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
   
	----------------- BUFF��� -------------------------------------------------
  	skill.BindBuff(1, 1327, 1);								-- ����1��λBuff
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
		skill.nAngleRange		= 64;								-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
 		--skill.nTargetCountLimit	= 10;							-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- ����֡��
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