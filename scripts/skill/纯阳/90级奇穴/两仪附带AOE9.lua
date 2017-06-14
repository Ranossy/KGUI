---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/���Ǹ���AOE9.lua
-- ����ʱ��:	2013/4/19 9:38:54
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �Ӽ���_���ǽ���_10����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-07-08
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 40*2.1, 	nDamageRand = 40*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 77*2.1, 	nDamageRand = 77*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 114*2.1, 	nDamageRand = 114*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 151*2.1, 	nDamageRand = 151*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 188*2.1, 	nDamageRand = 188*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 225*2.1, 	nDamageRand = 225*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 262*2.1, 	nDamageRand = 262*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 299*2.1, 	nDamageRand = 299*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 336*2.1, 	nDamageRand = 336*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 373*2.1, 	nDamageRand = 373*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 410*2.1, 	nDamageRand = 410*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 447*2.1, 	nDamageRand = 447*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 484*2.1, 	nDamageRand = 484*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 521*2.1, 	nDamageRand = 521*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 558*2.1, 	nDamageRand = 558*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 595*2.1, 	nDamageRand = 595*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 632*2.1, 	nDamageRand = 632*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 669*2.1, 	nDamageRand = 669*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 706*2.1, 	nDamageRand = 706*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 743*2.1, 	nDamageRand = 743*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 780*2.1, 	nDamageRand = 780*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 817*2.1, 	nDamageRand = 817*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 854*2.1, 	nDamageRand = 854*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 891*2.1, 	nDamageRand = 891*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 928*2.1, 	nDamageRand = 928*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 965*2.1, 	nDamageRand = 965*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 1002*2.1, 	nDamageRand = 1002*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 1039*2.1, 	nDamageRand = 1039*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 1076*2.1, 	nDamageRand = 1076*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 1113*2.1, 	nDamageRand = 1113*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 1150*2.1, 	nDamageRand = 1150*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 1187*2.1, 	nDamageRand = 1187*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 1224*2.1, 	nDamageRand = 1224*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 1261*2.1, 	nDamageRand = 1261*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 1298*2.1, 	nDamageRand = 1298*2.1,  nCostMana = 91}, --level 5	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 9;
    
	----------------- ħ������ -------------------------------------------------
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase/ 16*0.2, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand/ 16/20, -- ����ֵ1
		0																-- ����ֵ2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);


	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5649, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(3472, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						--����CD 1.5��
	--skill.SetNormalCoolDown(1, 489);

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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nHeight = 6 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	skill.nRectWidth = 6 * LENGTH_BASE;         
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	skill.nChannelInterval = 126; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame			= 8 * nSubsection;	-- ͨ��������ʱ�䣬��λ֡�� 
	-- ������ͨ��ʱ����Ϊ����AP���ݾ���ʱ��������Ч��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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