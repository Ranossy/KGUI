---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����Ͱ�AOE.lua
-- ����ʱ��:	2013/6/2 2:40:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��������_��ĸ����_����.lua
-- ������    :  �ź�	
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  
-- �书��·  :  ��������
-- ��������  :  ��ĸ����
-- ����Ч��  :  Զ�̴������ƣ���Ҫ����״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 280, nTherapy = 238*0.95, nTherapyRand = 238*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 253*0.95, nTherapyRand = 253*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 268*0.95, nTherapyRand = 268*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 283*0.95, nTherapyRand = 283*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 298*0.95, nTherapyRand = 298*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 313*0.95, nTherapyRand = 313*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 328*0.95, nTherapyRand = 328*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 343*0.95, nTherapyRand = 343*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 358*0.95, nTherapyRand = 358*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 373*0.95, nTherapyRand = 373*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 388*0.95, nTherapyRand = 388*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 403*0.95, nTherapyRand = 403*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 418*0.95, nTherapyRand = 418*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 433*0.95, nTherapyRand = 433*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 448*0.95, nTherapyRand = 448*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 463*0.95, nTherapyRand = 463*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 478*0.95, nTherapyRand = 478*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 493*0.95, nTherapyRand = 493*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 508*0.95, nTherapyRand = 508*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 523*0.95, nTherapyRand = 523*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 538*0.95, nTherapyRand = 538*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 553*0.95, nTherapyRand = 553*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 568*0.95, nTherapyRand = 568*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 583*0.95, nTherapyRand = 583*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 598*0.95, nTherapyRand = 598*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 613*0.95, nTherapyRand = 613*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 628*0.95, nTherapyRand = 628*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 643*0.95, nTherapyRand = 643*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 658*0.95, nTherapyRand = 658*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 673*0.95, nTherapyRand = 673*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 688*0.95, nTherapyRand = 688*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 703*0.95, nTherapyRand = 703*0.1, }, --level 2
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6633,
		8
	);
    
	
    
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5796, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);					--����CD1.5��
	--skill.SetNormalCoolDown(1, 441);					--����CD15��

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 48;				-- ����֡��
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 42;
 	elseif dwSkillLevel < 32 then
  		skill.nChannelInterval = 42 + (dwSkillLevel - 9) * 2
  	else
  		skill.nChannelInterval =95;     -- ͨ�������ʱ��   
 	end
	--skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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