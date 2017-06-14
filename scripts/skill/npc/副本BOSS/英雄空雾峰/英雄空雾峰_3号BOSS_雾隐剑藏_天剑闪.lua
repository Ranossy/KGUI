------------------------------------------------
-- �ļ���    :  Ӣ�ۿ����_3��BOSS_��������_�콣��.lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-9-8
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ǿ
-- �书��·  :  ���ǿ
-- ��������  :  �����ǿ
-- ����Ч��  :  ���̫ǿ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1317  *0.8, nDamageRand = 1317  *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 2232  *0.8, nDamageRand = 2232  *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 3202  *0.8, nDamageRand = 3202  *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 4658  *0.8, nDamageRand = 4658  *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 6115  *0.8, nDamageRand = 6115  *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 8412  *0.8, nDamageRand = 8412  *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 10031 *0.8, nDamageRand = 10031 *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 11649 *0.8, nDamageRand = 11649 *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 13268 *0.8, nDamageRand = 13268 *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 14886 *0.8, nDamageRand = 14886 *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 16504 *0.8, nDamageRand = 16504 *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 18123 *0.8, nDamageRand = 18123 *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 19741 *0.8, nDamageRand = 19741 *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 21360 *0.8, nDamageRand = 21360 *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 22978 *0.8, nDamageRand = 22978 *0.4, nCostMana = 0},		--level 15    
	{nDamageBase = 24596 *0.8, nDamageRand = 24596 *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 26215 *0.8, nDamageRand = 26215 *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 27833 *0.8, nDamageRand = 27833 *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 29452 *0.8, nDamageRand = 29452 *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 31070 *0.8, nDamageRand = 31070 *0.4, nCostMana = 0},		--level 20
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
                                                                                  
 
	    ----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(1393, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ��������Buff
	skill.AddSlowCheckSelfBuff(1394, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ��������Buff
	skill.AddSlowCheckSelfBuff(1395, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ��������Buff
	skill.AddSlowCheckSelfBuff(1396, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

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
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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