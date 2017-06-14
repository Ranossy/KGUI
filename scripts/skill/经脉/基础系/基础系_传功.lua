------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : zhangqi
-- ����ʱ��  : 2008-07-08
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : ����
-- ����Ч��  : ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")
Include("scripts/skill/����/Venation.lua")
Include("scripts/Map/����ϵͳ/include/FriendPraise_data.lua")
Include("scripts/Map/��������/�澭����¼/include/data.lua")
Include("scripts/Map/ʦͽϵͳ/include/δ��������֮·.lua")
tSkillData =
{
	{TransmitRate = 226, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{TransmitRate = 246, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{TransmitRate = 267, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{TransmitRate = 287, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{TransmitRate = 308, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{TransmitRate = 328, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{TransmitRate = 349, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{TransmitRate = 369, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{TransmitRate = 390, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{TransmitRate = 410, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1022,
--		1
--	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1023,
--		1
--	);

--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
--        ATTRIBUTE_TYPE.TRANSMIT_TRAIN,
--        200,
--        tSkillData[dwSkillLevel].TransmitRate
--    );
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ϵ/����ϵ_����.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- Call ����buff ,ʮ��֮��,���ܽ��ܴ���
		"skill/����/����ϵ/����ϵ_���ܴ���BUFF.lua", -- ���㹦�������
		0
	);
	--]]
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestBuff(1162, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
--	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת
	----------------- BUFF��� -------------------------------------------------

	--skill.BindBuff(1, 1162, 1);		-- -- Call ����buff Ŀ���д�buff���ܽ��ܴ���
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 376);
	skill.SetNormalCoolDown(2, 503);	--����1��GCD
	skill.SetCheckCoolDown(1, 444)
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
	skill.nMinRadius = 1 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 1920;				-- ����֡��
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
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
--[[function CanCast(player, nPreResult, SkillTarget)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	if not SkillTarget then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if SkillTarget.GetTargetType() ~= TARGET.PLAYER then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	local targetplayer = SkillTarget.GetPlayer()
	if not targetplayer then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if targetplayer.nLevel < 20 then
		player.SendSystemMessage("����ʧ�ܣ�ֻ�ܴ�����20�����ϵ����")
		return false;
	end
	local nPlayerVPP = GetGongliCount(player)
	local nTargetVPP = GetGongliCount(targetplayer)
	local nLevel = player.GetSkillLevel(1206)
	local nDisVPP = (nPlayerVPP - nTargetVPP)/nTargetVPP
	local nCostVP = 0
	local nReceiveVP = 0
	local nMentorET = 0
	local nApprenticeET = 0
	local nChongGuET = 0
	local nAfkReceiveET = 0
	local nAfkTransET = 0
	local nNewAccBuffCof = 1

	local AfkReceiveBuff = targetplayer.GetBuff(2031,1)	--�ж��Ƿ�AFK��һ���˽���BUFF
	local AfkTransBuff = player.GetBuff(2031,1)
	local NewAccBuff = targetplayer.GetBuff(2524,1) --�жϽ��ܴ������Ƿ�Ϊ���ʺŻ

	if AfkReceiveBuff or AfkTransBuff then		--AFK�����buff�½��ܴ�����ö���40�㣬������ö���15��
		nAfkReceiveET = 400
		nAfkTransET = 150
	end
	if player.IsMyApprentice(targetplayer.dwID) then
		nMentorET = 100
		nApprenticeET = 50
	end
	if NewAccBuff then--�жϽ��ܴ�����Ϊ���ʺŻ,�򴫹�˫����������10��
		nNewAccBuffCof = 10
	end

	if nTargetVPP <= 70000 then		--�������Ŀ�깦��С��70000�������Ӵ����߳�ǽ���
		nChongGuET = 320*nLevel
	end
	if nDisVPP <= 0 then		--��������
		nCostVP = 400 - nMentorET - nChongGuET - nAfkTransET
		if nCostVP < 0 then				---����������������Ϊ�������������ʺżӳ�ϵ��
			nCostVP = nNewAccBuffCof * nCostVP
		end
		nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
	elseif 	nDisVPP > 0 and nDisVPP < 0.5 then
		nCostVP = math.floor(-nDisVPP * 1100 + 400) - nMentorET - nChongGuET - nAfkTransET
		if nCostVP < 0 then
			nCostVP = nNewAccBuffCof * nCostVP
		end
		nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
	elseif nDisVPP >= 0.5 then
		nCostVP = -150 - nMentorET - nChongGuET - nAfkTransET
		if nCostVP < 0 then
			nCostVP = nNewAccBuffCof * nCostVP
		end
		nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
	end
	if player.IsMyApprentice(targetplayer.dwID) then
		player.SendSystemMessage("ʦͽ������ʦ��"..player.szName.."�������Ϊ����100�㣬ͽ��"..targetplayer.szName.."�������Ϊ����50�㣡")
		targetplayer.SendSystemMessage("ʦͽ������ʦ��"..player.szName.."�������Ϊ����100�㣬ͽ��"..targetplayer.szName.."�������Ϊ����50�㣡")
	end
	if nCostVP >= 0 then
		player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
		targetplayer.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
	elseif nCostVP < 0 then
		player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..-nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
		targetplayer.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..-nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
	end
	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName.."��Ϊ���㣬����ʧ�ܣ�")
		targetplayer.SendSystemMessage(player.szName.."��Ϊ���㣬����ʧ�ܣ�")
		return SKILL_RESULT_CODE.FAILED;
	end
	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName.."�������㣬����ʧ�ܣ�")
		targetplayer.SendSystemMessage(targetplayer.szName.."�������㣬����ʧ�ܣ�")
		return SKILL_RESULT_CODE.FAILED;
	end
	if -nCostVP >0 and -nCostVP > player.nMaxTrainValue - player.nCurrentTrainValue then
		player.SendSystemMessage("�����������㣬�޷����ȫ����Ϊ��")
	end

	if player.GetBuff(1263,1) == nil then
		player.AddBuff(player.dwID, player.nLevel,1387,1,0);  --��������buff
	end
	if  player.GetBuff(1263,1) == nil then	--���Ӿ�������debuff
		player.AddBuff(player.dwID, player.nLevel,1263,1,0);
	end
	return SKILL_RESULT_CODE.SUCCESS;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local VenaScene = player.GetScene();
	----20100728 ȡ�����ͷ���õ�20Сʱ����debuff��4Сʱ����debuff
--	local BuffOffline = nil
--	local BuffOnline = nil
--	BuffOffline = player.GetBuff(1163,0)	--�����߼�ʱbuff 10��1163��Ϊ1��1164���ܴ���
--	BuffOnline = player.GetBuff(1649,0)		--���߼�ʱbuff 10��1649��Ϊ1��1650���ܴ���
--	if BuffOffline and BuffOffline.nStackNum >= 9 then
--		player.DelGroupBuff(BuffOffline.dwID,BuffOffline.nLevel)
--		player.AddBuff(0,99,1164,1,0)
--	else
--		player.AddBuff(0,99,1163,1,0)
--	end
--	if BuffOnline and BuffOnline.nStackNum >= 9 then
--		player.DelGroupBuff(BuffOnline.dwID,BuffOnline.nLevel)
--		player.AddBuff(0,99,1650,1,0)
--	else
--		player.AddBuff(0,99,1649,1,0)
--	end

	local targetplayer = nil
	local eType,nTargetID = player.GetSkillTarget()
	if eType == TARGET.PLAYER then
		targetplayer = GetPlayer(nTargetID)
	end
	if not targetplayer then
		return false;
	end
	if IsPlayer(targetplayer.dwID) then
		if targetplayer.nLevel < 20 then
			player.SendSystemMessage("����ʧ�ܣ�ֻ�ܴ�����20�����ϵ����")
			return false;
		end
		local nPlayerVPP = GetGongliCount(player)
		local nTargetVPP = GetGongliCount(targetplayer)
		local nLevel = player.GetSkillLevel(1206)
		local nDisVPP = (nPlayerVPP - nTargetVPP)/nTargetVPP
		local nCostVP = 0
		local nReceiveVP = 0
		local nMentorET = 0
		local nApprenticeET = 0
		local nChongGuET = 0
		local nAfkReceiveET = 0
		local nAfkTransET = 0
		local nNewAccBuffCof = 1

		local AfkReceiveBuff = targetplayer.GetBuff(2031,1)	--�ж��Ƿ�AFK��һ���˽���BUFF
		local AfkTransBuff = player.GetBuff(2031,1)
		local NewAccBuff = targetplayer.GetBuff(2524,1) --�жϽ��ܴ������Ƿ�Ϊ���ʺŻ

		if AfkReceiveBuff or AfkTransBuff then		--AFK�����buff�½��ܴ�����ö���40�㣬������ö���15��
			nAfkReceiveET = 400
			nAfkTransET = 150
		end
		if player.IsMyApprentice(targetplayer.dwID) then
			nMentorET = 100
			nApprenticeET = 50
		end
		if NewAccBuff then--�жϽ��ܴ�����Ϊ���ʺŻ,�򴫹�˫����������10��
			nNewAccBuffCof = 10
		end

		if nTargetVPP <= 70000 then		--�������Ŀ�깦��С��70000�������Ӵ����߳�ǽ���
			nChongGuET = 320*nLevel
		end
		if nDisVPP <= 0 then		--��������
			nCostVP = 400 - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then				---����������������Ϊ�������������ʺżӳ�ϵ��
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		elseif 	nDisVPP > 0 and nDisVPP < 0.5 then
			nCostVP = math.floor(-nDisVPP * 1100 + 400) - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		elseif nDisVPP >= 0.5 then
			nCostVP = -150 - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		end
--		if nCostVP >= 0 then
--			player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
--			targetplayer.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
--		elseif nCostVP < 0 then
--			player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..-nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
--			targetplayer.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ�������������Ϊ "..-nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ������������Ϊ"..nReceiveVP.."�㣡")
--		end
		if player.nCurrentTrainValue < nCostVP then
			player.SendSystemMessage(player.szName.."��Ϊ���㣬����ʧ�ܣ�")
			targetplayer.SendSystemMessage(player.szName.."��Ϊ���㣬����ʧ�ܣ�")
			return false;
		end
		if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
			player.SendSystemMessage(targetplayer.szName.."�������㣬����ʧ�ܣ�")
			targetplayer.SendSystemMessage(targetplayer.szName.."�������㣬����ʧ�ܣ�")
			return false;
		end
		if nCostVP >= 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ���������Ϊ "..nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ��������Ϊ"..nReceiveVP.."�㣡")
		elseif nCostVP < 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName.."������"..nPlayerVPP.."��".."ʩչ���������Ϊ "..-nCostVP.."�㣬"..targetplayer.szName.."������"..nTargetVPP.."��".."���ܴ��������Ϊ"..nReceiveVP.."�㣡")
		end
--		if nTargetVPP <= 70000 then		--�����߹���С��70000������˫�����Գ����Ѩ�¼���
--			local nRandFM = Random(10000)
--			local VenaSkill = GetSkill(9,1)
--			if nRandFM >= 1 and nRandFM <= 1000 then	--ÿ�δ�����10%������������Ѩ�¼���
--				local nPlayerRandLevel = RandFreshManVenationEffect(player)
--				local nTargetRandLevel = RandFreshManVenationEffect(targetplayer)
--				local nPlayerXiajiyuLevel = player.GetSkillLevel(9)
--				local nTargetPlayerXiajiyuLevel = targetplayer.GetSkillLevel(9)
--				if nPlayerRandLevel then
--					VenaScene.SendMessage(player.szName.."��ʿ������"..targetplayer.szName.."���������ڣ�ֱ�ᵤ��ɹ���ͨ"..VenaSkill.szSkillName.." ��"..nPlayerRandLevel.."�أ�")
--					if nPlayerRandLevel == 10 then
--						Log(player.szName .. " �ɹ���ͨ " .. VenaSkill.szSkillName .. " ��10�ء�");
--					end
--				else
--					VenaScene.SendMessage(player.szName.."��ʿ������"..targetplayer.szName.."���������뵤��֮ʱ��Ȼ��壬����ͻ��"..VenaSkill.szSkillName.." ��"..nPlayerXiajiyuLevel.."��ʧ�ܣ�")
--				end
--				if nTargetRandLevel then
--					VenaScene.SendMessage(targetplayer.szName.."����"..player.szName.."��ʿ�������������ڣ�ֱ�ᵤ��ɹ���ͨ"..VenaSkill.szSkillName.." ��"..nTargetRandLevel.."�أ�")
--					if nTargetRandLevel == 10 then
--						Log(targetplayer.szName .. " �ɹ���ͨ " .. VenaSkill.szSkillName .. " ��10�ء�");
--					end
--				else
--					VenaScene.SendMessage(targetplayer.szName.."����"..player.szName.."��ʿ�������������뵤��֮ʱ��Ȼ��壬����ͻ��"..VenaSkill.szSkillName.." ��"..nTargetPlayerXiajiyuLevel.."��ʧ�ܣ�")
--				end
--			end
--		end
	end
	player.AddAchievementCount(128, 1)	--���Ӵ����ɾͼ���
end--]]

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
function CanCast(player, nPreResult, SkillTarget)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	--local tList = player.GetPartyMemberList()
--	local eTargetType, dwID = player.GetTarget()
	local targetplayer = SkillTarget.GetPlayer() --ͽ��
	--[[
	if eTargetType == TARGET.PLAYER then
		
		if tList then
			for i = 1, #tList do
				if dwID == tList[i] and  player.dwID ~= dwID then
					return SKILL_RESULT_CODE.SUCCESS;
				end
			end
		if not targetplayer.IsParty(player.dwID, dwID)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "Ŀ�겻���Լ��Ķ���", 4)
			return SKILL_RESULT_CODE.FAILED;
		else
		end
			
		if not IsParty(player.dwID, targetplayer.dwID) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "Ŀ�겻���Լ��Ķ���", 4)
			return SKILL_RESULT_CODE.FAILED;
		end
	end
	--]]

	-- �ж�ͽ�ܺ�ʦ���Ƿ����
	if not IsParty(player.dwID, targetplayer.dwID) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 362), 4)
		return SKILL_RESULT_CODE.FAILED;
	end
	
	if not SkillTarget then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if SkillTarget.GetTargetType() ~= TARGET.PLAYER then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	--local targetplayer = SkillTarget.GetPlayer()
	if not targetplayer then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if targetplayer.nLevel < 20 then
		player.SendSystemMessage(GetEditorString(2, 8060))
		return SKILL_RESULT_CODE.FAILED;
	end

	local nCostVP = 3000
	local nReceiveVP = 10000
	local ApprenticeET = 1000
	local tLevelUpData = GetLevelUpData(targetplayer.nRoleType, targetplayer.nLevel)

	--if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
	--	nCostVP = 10000
	--	nReceiveVP = 10000
	--else
	--	nReceiveVP = 10000
	--end

	if not tLevelUpData then
		return false
	end

	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName ..GetEditorString(2, 8065))
		targetplayer.SendSystemMessage(player.szName ..GetEditorString(2, 8065))
		return SKILL_RESULT_CODE.FAILED;
	end
	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName ..GetEditorString(2, 8059))
		targetplayer.SendSystemMessage(targetplayer.szName ..GetEditorString(2, 8059))
		return SKILL_RESULT_CODE.FAILED;
	end
	if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
		local sMsg = GetEditorString(6, 7677).. targetplayer.szName .. GetEditorString(6, 7678).. nReceiveVP ..GetEditorString(2, 8050)
		local sMsg1 = player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050);
		if  targetplayer.nLevel < targetplayer.nMaxLevel then
			local nAddExp = math.floor(tLevelUpData.Experience * 80 / 100);
			if nAddExp > 400000 then	--�������İ汾��������þ���ⶥΪ40W��
				nAddExp = 400000
			end

			local nTime = GetCurrentTime()
			local nStartTime = DateToTime(2015, 10, 26, 7, 0, 0)
			local nEndTime = DateToTime(2015, 11, 23, 7, 0, 0)
			if nTime > nEndTime or nTime < nStartTime or targetplayer.nLevel < 90 then
				sMsg = GetEditorString(6, 7677).. targetplayer.szName .. GetEditorString(6, 7678).. nReceiveVP ..GetEditorString(6, 7688) .. nAddExp .. GetEditorString(2, 8050)
				sMsg1 = player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054) ..targetplayer.szName .. GetEditorString(2, 8055) .. nReceiveVP .. GetEditorString(9, 885) .. nAddExp .. GetEditorString(2, 8050)
			elseif targetplayer.nLevel >= 90 then
				player.SendSystemMessage(GetEditorString(8, 5158))
				targetplayer.SendSystemMessage(GetEditorString(8, 5158))
			end
			player.SendSystemMessage(sMsg)
			targetplayer.SendSystemMessage(sMsg)
			player.SendSystemMessage(sMsg1)
			targetplayer.SendSystemMessage(sMsg1)
		else
			player.SendSystemMessage(player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050))
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050))
		end
	end
	
	if player.GetBuff(1263, 1) == nil then
		player.AddBuff(player.dwID, player.nLevel, 1387, 1, 0);  --��������buff
	end
	if  player.GetBuff(1263, 1) == nil then	--���Ӿ�������debuff
		player.AddBuff(player.dwID, player.nLevel, 1263, 1, 0);
		local buff = player.GetBuff(1263, 1)
		if buff then
			buff.nCustomValue = targetplayer.dwID
		end
		
		if 	tMasterAndDiscipleQuest.IsMyMentor(targetplayer, player) and targetplayer.GetQuestPhase(16687) == 1  and targetplayer.GetKungfuMount() then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QixueTeachBy.Open", 119000, targetplayer.GetKungfuMount().dwSkillID, false) -- ʦ
			RemoteCallToClient(targetplayer.dwID, "CallUIGlobalFunction", "QixueTeachBy.Open", 119000, targetplayer.GetKungfuMount().dwSkillID, true) -- ͽ��
		end
	end

		
	return SKILL_RESULT_CODE.SUCCESS;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwPlayerID)
	local player = GetPlayer(dwCharacterID)
	local VenaScene = player.GetScene();
	local targetplayer = nil
	local eType, nTargetID = player.GetSkillTarget()
	if eType == TARGET.PLAYER then
		targetplayer = GetPlayer(nTargetID)
	end
	if not targetplayer then
		return false
	end
	if IsPlayer(nTargetID) then
		if targetplayer.nLevel < 20 then
			player.SendSystemMessage(GetEditorString(2, 8060))
			return SKILL_RESULT_CODE.FAILED;
		end
	end
	local nCostVP = 3000
	local nReceiveVP = 10000
	local tLevelUpData = GetLevelUpData(targetplayer.nRoleType, targetplayer.nLevel)
--	local ApprenticeET = 7000

	--if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID)then
	--	nCostVP = 10000
	--	nReceiveVP = 10000
	--else
	--	nReceiveVP = 10000
	--end

	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName..GetEditorString(2, 8065))
		targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8065))
		player.ClearCDTime(376)
		return SKILL_RESULT_CODE.FAILED;
	end

	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
		targetplayer.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
		player.ClearCDTime(376)
		return SKILL_RESULT_CODE.FAILED;
	end

	if not tLevelUpData then
		player.ClearCDTime(376)
		return false
	end
	if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
		local cacheMentor = GetMentorCache()
		if  targetplayer.nLevel < targetplayer.nMaxLevel then
			local nAddExp = math.floor(tLevelUpData.Experience * 80 / 100);
			if nAddExp > 400000 then	--�������İ汾��������þ���ⶥΪ40W��
				nAddExp = 400000
			end
			--local nTime = GetCurrentTime()
			--local nStartTime = DateToTime(2015, 10, 26, 7, 0, 0)
			--local nEndTime = DateToTime(2015, 11, 23, 7, 0, 0)
			--if nTime > nEndTime or nTime < nStartTime or targetplayer.nLevel < 90 then
			
			targetplayer.AddExp(nAddExp);
			player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(9, 885) ..  nAddExp .. GetEditorString(2, 8050))	
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(9, 885) ..  nAddExp .. GetEditorString(2, 8050))
			--elseif targetplayer.nLevel >= 90 then
			--player.SendSystemMessage("Ϊȷ�����弶��������Ĺ�ƽ�ԣ�10��26-11��23���ڼ䣬ʦ����90������ͽ�ܴ��������ٶ�����������ֵ��")
			--targetplayer.SendSystemMessage("Ϊȷ�����弶��������Ĺ�ƽ�ԣ�10��26-11��23���ڼ䣬ʦ����90������ͽ�ܴ��������ٶ�����������ֵ��")
			--	end
			if targetplayer.IsMyMentor(player.dwID) then
				cacheMentor.AddMentorValue(dwCharacterID, targetplayer.dwID, 15)--��ʦͽֵ
				player.SendSystemMessage(GetEditorString(7, 2958))
			end
		else
			player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))
		end
		if targetplayer.GetQuestPhase(16687) ~= 1 then -- ��Ѩ
			OpenPraiseOfOneMaster(targetplayer, player); --��ʦ�����޽���
		end

		local nQuestIdx = targetplayer.GetQuestIndex(16681)
		if nQuestIdx and targetplayer.GetQuestPhase(16681) == 1 then
			targetplayer.SetQuestValue(nQuestIdx, 0, 1)
		end
		nQuestIdx = targetplayer.GetQuestIndex(16686) --��������
		if nQuestIdx and targetplayer.GetQuestPhase(16686) == 1 then
			local nQuestValue = targetplayer.GetQuestValue(nQuestIdx, 0)
			if nQuestValue <=2 then 
				targetplayer.SetQuestValue(nQuestIdx, 0, nQuestValue + 1)
			end
		end
		
		nQuestIdx = targetplayer.GetQuestIndex(16687) -- ����Ѩ
		if nQuestIdx and targetplayer.GetQuestPhase(16687) == 1 then
			tMasterAndDiscipleQuest.SetQiXu(targetplayer) -- ����Ѩ
			targetplayer.SetQuestValue(nQuestIdx, 0, 1)
		end
	else
		player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
		targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))		
	end
	player.AddTrain(-nCostVP)
	targetplayer.AddTrain(nReceiveVP)
	targetplayer.AddBuff(0,99,1162,1,0)
	player.AddAchievementCount(128, 1)	--���Ӵ����ɾͼ���
	player.AddFellowshipAttraction(targetplayer.dwID, 20)	--�øж�
	Adventure_ChuanGong.TryStartAdventure(player)--�������ʱ���Կ�������
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com