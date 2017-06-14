------------------------------------------------
-- �ļ���    :  Ӣ�ۿ����_1��BOSS_Ϧ��˫_����ն(�Ӽ���).lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-9-15
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��£�
-- ����Ч��  :  ��֪����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 871   *0.4, nDamageRand = 871   *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 1
	{nDamageBase = 1475  *0.4, nDamageRand = 1475  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 2
	{nDamageBase = 2116  *0.4, nDamageRand = 2116  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 3
	{nDamageBase = 3079  *0.4, nDamageRand = 3079  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 4
	{nDamageBase = 4042  *0.4, nDamageRand = 4042  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 5
	{nDamageBase = 5560  *0.4, nDamageRand = 5560  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 6
	{nDamageBase = 6630  *0.4, nDamageRand = 6630  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 7
	{nDamageBase = 7700  *0.4, nDamageRand = 7700  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 8
	{nDamageBase = 8769  *0.4, nDamageRand = 8769  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 9
	{nDamageBase = 9839  *0.4, nDamageRand = 9839  *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 10
	{nDamageBase = 10909 *0.4, nDamageRand = 10909 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 11
	{nDamageBase = 11978 *0.4, nDamageRand = 11978 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 12
	{nDamageBase = 13048 *0.4, nDamageRand = 13048 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 13
	{nDamageBase = 14118 *0.4, nDamageRand = 14118 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 14
	{nDamageBase = 15187 *0.4, nDamageRand = 15187 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 15    
	{nDamageBase = 16257 *0.4, nDamageRand = 16257 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 16
	{nDamageBase = 17327 *0.4, nDamageRand = 17327 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 17
	{nDamageBase = 18396 *0.4, nDamageRand = 18396 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 18
	{nDamageBase = 19466 *0.4, nDamageRand = 19466 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 19
	{nDamageBase = 20536 *0.4, nDamageRand = 20536 *0.2, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 20
};  
    
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1410,
		1
	);
	    ----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	skill.AddSlowCheckDestBuff(1410,	1,	BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ����Ŀ��Buff
    
	    ----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	    --skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	    --skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	    --skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff
   
    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);
   
   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	 --skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

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
	skill.nMaxRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 29 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
       --skill.nBrokenRate         = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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