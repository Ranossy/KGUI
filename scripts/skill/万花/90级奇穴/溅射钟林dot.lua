---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/��������dot.lua
-- ����ʱ��:	2013/4/24 10:59:59
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_��Ѩ����_����ָ.lua
-- ������    :  �Ͻ�	
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  1.5������
-- �书��·  :  ��Ѩ����
-- ��������  :  ����ָ
-- ����Ч��  :  Զ�����Գ������ˣ�����18��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDotID = 714, nDotLevel = 1 }, -- Level 1
	{ nDotID = 714, nDotLevel = 2 }, -- Level 2
	{ nDotID = 714, nDotLevel = 3 }, -- Level 3
	{ nDotID = 714, nDotLevel = 4 }, -- Level 4
	{ nDotID = 714, nDotLevel = 5 }, -- Level 5
	{ nDotID = 714, nDotLevel = 6 }, -- Level 6
	{ nDotID = 714, nDotLevel = 7 }, -- Level 1
	{ nDotID = 714, nDotLevel = 8 }, -- Level 2
	{ nDotID = 714, nDotLevel = 9 }, -- Level 3
	{ nDotID = 714, nDotLevel = 10 }, -- Level 4
	{ nDotID = 714, nDotLevel = 11 }, -- Level 5
	{ nDotID = 714, nDotLevel = 12 }, -- Level 6
	{ nDotID = 714, nDotLevel = 13 }, -- Level 1
	{ nDotID = 714, nDotLevel = 14 }, -- Level 2
	{ nDotID = 714, nDotLevel = 15 }, -- Level 3
	{ nDotID = 714, nDotLevel = 16 }, -- Level 4
	{ nDotID = 714, nDotLevel = 17 }, -- Level 5
	{ nDotID = 714, nDotLevel = 18 }, -- Level 6
	{ nDotID = 714, nDotLevel = 19 }, -- Level 1
	{ nDotID = 714, nDotLevel = 20 }, -- Level 2
	{ nDotID = 714, nDotLevel = 21 }, -- Level 3
	{ nDotID = 714, nDotLevel = 22 }, -- Level 4
	{ nDotID = 714, nDotLevel = 23 }, -- Level 5
	{ nDotID = 714, nDotLevel = 24 }, -- Level 6
  
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	skill.BindBuff(1, tSkillData[dwSkillLevel].nDotID, tSkillData[dwSkillLevel].nDotLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(2, 175);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
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
	skill.nMaxRadius = 24 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 32;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48;
	elseif dwSkillLevel < 24 then
		skill.nChannelInterval = 48 + (dwSkillLevel - 9) * 8
	else
		skill.nChannelInterval =175;     -- ͨ�������ʱ��   
	end
	
	--skill.nChannelInterval = 175; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID) 
  
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com