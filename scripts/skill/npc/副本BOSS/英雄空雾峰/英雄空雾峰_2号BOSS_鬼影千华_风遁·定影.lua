------------------------------------------------
-- �ļ���    :  Ӣ�ۿ����_2��BOSS_��Ӱǧ��_��ݡ���Ӱ.lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-9-8
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
	{nDamageBase = 448   *0.8, nDamageRand = 448   *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 1
	{nDamageBase = 759   *0.8, nDamageRand = 759   *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 2
	{nDamageBase = 1089  *0.8, nDamageRand = 1089  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 3
	{nDamageBase = 1584  *0.8, nDamageRand = 1584  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 4
	{nDamageBase = 2079  *0.8, nDamageRand = 2079  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 5
	{nDamageBase = 2860  *0.8, nDamageRand = 2860  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 6
	{nDamageBase = 3410  *0.8, nDamageRand = 3410  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 7
	{nDamageBase = 3961  *0.8, nDamageRand = 3961  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 8
	{nDamageBase = 4511  *0.8, nDamageRand = 4511  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 9
	{nDamageBase = 5061  *0.8, nDamageRand = 5061  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 10
	{nDamageBase = 5612  *0.8, nDamageRand = 5612  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 11
	{nDamageBase = 6162  *0.8, nDamageRand = 6162  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 12
	{nDamageBase = 6712  *0.8, nDamageRand = 6712  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 13
	{nDamageBase = 7262  *0.8, nDamageRand = 7262  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 14
	{nDamageBase = 7813  *0.8, nDamageRand = 7813  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 15    
	{nDamageBase = 8363  *0.8, nDamageRand = 8363  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 16
	{nDamageBase = 8913  *0.8, nDamageRand = 8913  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 17
	{nDamageBase = 9463  *0.8, nDamageRand = 9463  *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 18
	{nDamageBase = 10014 *0.8, nDamageRand = 10014 *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 19
	{nDamageBase = 10564 *0.8, nDamageRand = 10564 *0.4, nCostMana = 0, nBuffID=1053, nBuffLevel= 1},		--level 20
};  
    
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	    ----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	    ----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 1391,1)	-- ����1��λBuff
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
	skill.nMaxRadius		= 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
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