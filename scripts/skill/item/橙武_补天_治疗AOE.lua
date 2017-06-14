------------------------------------------------
-- �ļ���    :  
-- ������    :  zhx	
-- ����ʱ��  :  20110613
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  
-- �书��·  :  ��������
-- ��������  :  ��������
-- ����Ч��  :  ����Χ���ƣ���Ҫ����״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapy = 100   /5 * 0.95,  nTherapyRand = 100   /5 * 0.1, nCostMana = 159*5},		--level 1
	{ nTherapy = 120   /5 * 0.95,  nTherapyRand = 120   /5 * 0.1, nCostMana = 224*5},		--level 2
	{ nTherapy = 140   /5 * 0.95,  nTherapyRand = 140   /5 * 0.1, nCostMana = 273*5},		--level 3
	{ nTherapy = 160   /5 * 0.95,  nTherapyRand = 160   /5 * 0.1, nCostMana = 321*5},		--level 4
	{ nTherapy = 180   /5 * 0.95,  nTherapyRand = 180   /5 * 0.1, nCostMana = 369*5},		--level 5
	{ nTherapy = 200   /5 * 0.95,  nTherapyRand = 200   /5 * 0.1, nCostMana = 417*5},		--level 6
	{ nTherapy = 220   /5 * 0.95,  nTherapyRand = 220   /5 * 0.1, nCostMana = 417*5},		--level 7
};
tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},

}  
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		2584,
		1
	);

  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		4096,
		0
	);

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,								-- ħ������
   		0,							-- ����ֵ1
   		-512																-- ����ֵ2
   		);
   		
   		
  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy* (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand* (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0, 
		0
	);
    
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
     skill.AddSlowCheckSelfBuff(2584, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
 
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2584, 1);		-- ����1��λBuff    
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444);
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
 	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/7)*1093;	-- �������ĵ�����
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 0;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
    skill.nTargetCountLimit	= 6;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 32; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 160;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 1024;	-- ���ܱ���ϵĸ���.����1024
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